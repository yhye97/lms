var express = require('express');
var request = require('request');

var router = express.Router();

//find content list
function find_content_list(school_id, grade, callback) {
    console.log("find content list");
    var content_list = [];
    var count=0;
    var length=0;
    var sqlquery1 = "SELECT * FROM contents WHERE school_id =? AND grade=?";
    var params=[school_id, grade];
    connection.query(sqlquery1, params, function (err, rows) {
        if (rows.length != 0) {
                length=rows.length;
                for(var i=0;i<rows.length; i++){
                    var content= {
                        content_id: rows[i].contents_id,
                        content_name: rows[i].contents_name,
                        content_description: rows[i].contents_description,
                        school_id: rows[i].school_id,
                        grade: rows[i].grade
                    };
                    content_list.push(content);
                    count++;
                }
            if(count==length){
                console.log("length"+length);
                console.log(content_list);
                callback(true, content_list);
            }else{
                callback(false, content_list);
            }
        }else{
            callback(false, content_list);
        }
    });
}

//find user info
function find_user_info(user_id,callback) {
    console.log("find user info");
    var school_id=-1;
    var grade=0;
    var user_name="";
    var sqlquery = "SELECT user_name, school_id, grade FROM users WHERE user_id=?";
    connection.query(sqlquery, user_id, function (err, rows) {
        if (rows.length !=0) {
            school_id=rows[0].school_id;
            grade=rows[0].grade;
            user_name=rows[0].user_name;
            find_content_list( school_id, grade,function(result, content_list){
                if(result==true){
                    callback(true,school_id,grade,content_list,user_name);
                }
            });
        } else {
            callback(false,school_id,grade,"",user_name);
        }
    });
}

/* GET users listing. */
router.get('/', function (req, res, next) {
    console.log('get homepage');
    if(req.session.user_id){
        find_user_info(req.session.user_id, function(result,school_id, grade, content_list,user_name) {
            if(result==true) {
                res.render('lms', {
                    title: "LMS",
                    user_id: req.session.user_id,
                    school_id: school_id,
                    grade: grade,
                    content_list: content_list,
                    user_name: user_name
                });
            }else{
                res.render('lms', {
                    title: "LMS",
                    user_id: req.session.user_id,
                    schoo_id:0,
                    grade:0,
                    content_list: [],
                    user_name: user_name
                });
            }
        })
    }else{
         res.redirect('/login');
    }
});

module.exports = router;
