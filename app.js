// Requiring the module
const express = require('express');
const app = express();

// Route handling - handling '/' request
app.get('/', (req, res) => res.send('Hello world!'));
app.get('/about', (req, res) => res.send('<h2>Testing Docker using Express</h2>'));
app.get('/docker', (req, res) => {
    res.send("hello from docker");
});
app.get('/nodemon', (req, res) => res.send('hello from nodemon'));

// Server setup
const port = process.env.PORT;
app.listen(port, () => console.log(`Example app listening on port ${port}!`));