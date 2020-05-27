var crypto = require('crypto');
const key = "waste_recylcling_management";

exports.cryptoHash = function(pw){
    var hash_num = crypto.createHash('sha1');
    hash_num.update(pw);
    return hash_num.digest('hex');
};

exports.encrypt = function(text){
    var cipher = crypto.createCipher('aes-256-cbc',key);
    var entext = cipher.update(text,'utf8','hex');
    entext += cipher.final('hex');
    return entext;
};

exports.decrypt = function(text){
    var decipher = crypto.createDecipheriv('aes-256-cbc',key);
    var detext = decipher.update(text,'hex','utf8');
    detext += decipher.final('utf8');
    return detext;
};