const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const http = require('http');
const app = express();
const cors = require('cors');
app.use(cors())
const port = process.env.PORT || '3000';
app.set('port', port);
let serverio=app.listen(port,()=>{
    console.log('Application runn on Port :- 4222 ')
});
const api = require('./server/api');
// Parsers
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false}));
app.use('/api', api);
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'dist/index.html'));
});