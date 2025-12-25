const express = require('express');

//---app configuration---
const app = express();
const port = 3000;

//---middleware---
app.use(express.json());

//---routes---
//read
app.get('/api/v1/item', (req, res) => {
  res.send('Hello World!');
});

//create
app.post('/api/v1/item', (req, res) => {});

//update
app.put('/api/v1/item/:id', (req, res) => {});

//delete
app.delete('/api/v1/item/:id', (req, res) => {});

//---listening to the server---
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
