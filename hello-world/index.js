var express = require('express'); //express module을 불러온다.
var app = express();

app.set("view engine","ejs");
app.use(express.static(__dirname + '/public'));

app.get("/hello", function(req,res){ // '/' 위치에 'get' 요청을 받는다.
 res.render("hello", {name:req.query.nameQuery});
});

app.get("/hello/:nameParam", function(req,res){
 res.render("hello", {name:req.params.nameParam});
});

app.listen(3000, function(){ // 3000번 포트를 사용한다.
 console.log('Server On!');
});
