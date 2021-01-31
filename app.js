// Requiring the module
const express = require('express');
const app = express();

// Route handling - handling '/' request
app.get('/', (req, res) => res.send('Hello Regina!'));
app.get('/about', (req, res) => res.send('<h2>Testing Docker using Express</h2>'))

// Server setup
const port = process.env.PORT;
app.listen(port, () => console.log(`Example app listening on port ${port}!`));