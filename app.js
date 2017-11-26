const http = require('http')


const port = process.env.PORT || 8080;
const host = process.env.HOST || 'localhost';

http.createServer((req,res) => {

	res.end("Server Response ...");
}).listen(port , () => { console.log("Server is listening at %s:%s" , host, port)});
