var http = require('http');
var fs = require('fs');
var url = require('url');
var shell = require('shelljs')

http.createServer(function (req, res) {
    res.writeHead(200, {
        'Content-Type': 'text/html'
    });
    var endPoint = req.url;
    var queryData = url.parse(endPoint, true).query;
    
    /*if (endPoint.includes("/append")) {
        console.log("Appending...")
        handleAppend(req, res, queryData);
    }
    else if (endPoint.includes("/reset")) {
        handleReset(req, res, queryData);
    }
    else if (endPoint.includes("/print")) {
        handlePrint(req, res, queryData);
    }*/
    if (endPoint.includes("/githook")) {
        handleGitPull(req, res, queryData);
    }
    else{
        res.end("Good bye dude");
    }

}).listen(8082);

function handleGitPull(req, res, queryData) {
    if (queryData.id === "1") {
        shell.exec("bash /home/pi/github/GitAutoPull/pull.sh");
    }
    else if (queryData.id === "4") {
        shell.exec("bash /home/pi/github/GitAutoPull/pullWishList.sh");
    }
    else if (queryData.id === "5") {
        shell.exec("sudo bash /var/www/dimission/pull");
    }
    res.end("Pulling..")
}

console.log("Running...")