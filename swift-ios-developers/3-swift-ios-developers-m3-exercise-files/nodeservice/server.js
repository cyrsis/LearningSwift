var http = require('http');
var os = require('os');

http.createServer(function(req,res){
  res.writeHead(200, {'Content-Type':'application/json'});
  var ret = { 'host':os.hostname()
              ,'totalMemory':os.totalmem()
              ,'freeMemory':os.freemem()
              ,'tempDirectory':os.tmpdir()
              ,'uptime':os.uptime()
              ,'type':os.type()
              ,'platform':os.platform()
              ,'cpus':os.cpus()}
  res.write(JSON.stringify(ret))
  res.end()
}).listen(8081);
console.log('server up and running');


