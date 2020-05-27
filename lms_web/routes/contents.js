var express = require('express');
var router = express.Router();
// import entire SDK
var AWS = require('aws-sdk');
// import AWS object without services
var AWS = require('aws-sdk/global');
// import individual service
var S3 = require('aws-sdk/clients/s3');

//find content list
function find_content_url(content_id, callback) {
    var sqlquery1 = "SELECT * FROM contents WHERE contents_id=?";
    var params=[content_id];
    connection.query(sqlquery1, params, function (err, rows) {
        if (rows.length != 0) {
            var content= {
                    content_id: rows[0].contents_id,
                    s3_key: rows[0].s3_key,
                    cache_id: rows[0].cache_id,
                grid_id: rows[0].grid_id,
                };
                callback(true,content)
            }else{
            callback(false,-1)
        }
    });
}

/* GET users listing. */
router.get('/:content_id', function (req, res, next) {
    console.log('get content');
    var content_id=req.params.content_id;
    if(req.session.user_id){
        find_content_url(content_id ,function(result,content){
            if(result==true){
                res.render('content', {
                    title: "CONTENT",
                    user_id: req.session.user_id,
                    content: content
                });
            }else{
                res.redirect('/lms')
            }
        });
    }else{
        res.redirect('/login');
    }
});
module.exports = router;
