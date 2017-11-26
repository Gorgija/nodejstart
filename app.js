const http = require('http')


const port = process.env.PORT || 8080;
const host = process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0';

http.createServer((req,res) => {

	res.end("Server Response ...");
}).listen(port , () => { console.log("Server is listening at %s:%s" , host, port)});
