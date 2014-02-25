var http = require('http');
var static_ = require('node-static');

var staticServer = new static_.Server('./public');

var server = http.createServer(function (request, response) {
  request.addListener('end', function () {
    staticServer.serve(request, response);
  }).resume();
}).listen(Number(process.env.NODE_PORT));

console.log('Start server listening on port ' + process.env.NODE_PORT);
