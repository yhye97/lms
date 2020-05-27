var express = require('express');
var request = require('request');
var mysql = require('mysql');
var async = require('async');
var cryptoM = require('../public/modules/cryptoM.js');
const router = express.Router();

//get index
    router.get('/', function (req, res, next) {
      console.log('get homepage');
      if(req.session.user_id){
        res.render('index', {
          title: "Home",
          user_id: req.session.user_id
        });
      }else{
        // res.redirect('/login');
       res.render('index', {
         title: "Home"
       });
  }
});

//get register
router.get('/register', function (req, res, next) {
  res.render('register', {
    title: "Sign up",
    user_id: -1,
  });
});

//post register
router.post('/register', function (req, res, next) {
  var user_id = req.body.user_id;
  var user_pw = req.body.user_pw;
  var user_name = req.body.user_name;
  var school_id = req.body.school_id;
  var grade = req.body.grade;
  console.log(user_id);
  var sqlquery = "SELECT * FROM users WHERE user_id = ?";
  connection.query(sqlquery, user_id, function (err, rows) {
    if (rows.length == 0) {
      user_pw = cryptoM.encrypt(user_pw);
      console.log("userpw : ", user_pw);
      var sql2 = "INSERT INTO users (user_id, user_pw, user_name, school_id, grade) VALUES (?,?,?,?,?)";
      connection.query(sql2, [user_id, user_pw,user_name, school_id, grade], function (err) {
        if (err) {
          console.log("inserting user failed");
          throw err;
        } else {
          console.log("user inserted successfully");
          res.redirect("/login");
        }
      })
    } else {
      console.log("이미 있는 ID, ID를 다시 입력해주세요!");
      res.redirect("/login");
      throw err;
    }
  });
});

//get login
router.get('/login', function (req, res, next) {
  if (req.session.user_id) {
    res.render('login', {
      title: "Home",
      user_id: req.session.user_id,
    });
  } else {
    res.render('login', {
      title: "Home",
      user_id: -1,
    });
  }
});

//post login
router.post('/login', function (req, res, next) {
  var user_id = req.body.user_id;
  var user_pw = req.body.user_pw;
  console.log(user_id);
  var sqlquery = "SELECT  * FROM users WHERE user_id = ?";
  connection.query(sqlquery, user_id, function (err, row) {
    if (err) {
      console.log("no match");
      res.redirect('/');
    } else {
      console.log(row);
      console.log(row.length);
      if (row.length != 0) {
        /*var bytes = cryptoM.decrypt(row[0].user_pw);
        if (bytes === user_pw) {
          console.log("user login successfully");
          console.log(row[0].user_id);
          req.session.user_id = row[0].user_id;
          //redirect path according to user_type
          res.redirect('/lms');
        } else {
          console.log(bytes)
          console.log("wrong password!");
          res.render('login', {
            msg: "아이디나 비밀번호가 일치하지 않습니다."
          });*/
        if(user_pw=row[0].user_pw){
          console.log("user login successfully");
          console.log(row[0].user_id);
          req.session.user_id = row[0].user_id;
          //redirect path according to user_type
          res.redirect('/lms');
        }else{
          res.render('login', {
            msg: "비밀번가 일치하지 않습니다."
          });
        }
      } else {// no matching id
        res.render('login', {
          msg: "아이디가 일치하지 않습니다."
        });
      }
    }
  });
});

//logout
router.get('/logout', function (req, res, next) {
  req.session.destroy();  // 세션 삭제
  res.clearCookie('sid'); // 세션 쿠키 삭제
  res.redirect('/');
});

module.exports = router;