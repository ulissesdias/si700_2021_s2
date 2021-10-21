const express = require('express');

const app = express();
app.use(express.json());


app.get('/', (req, res) => {
    res.send("Culpa do Cliente");
});

const notes = [
    {title : "Primeiro Título", description : "Essa é a primeira Descrição!"},
    {title : "Segundo Título", description : "Culpa do Cliente"}
];

const endpoint = "/notes"

app.get(endpoint, (req, res) => {
    res.send(notes);
});


app.get(`${endpoint}/:id`, (req, res) => {
    const id = req.params.id;
    const note = notes[id];

    if (note) {
	res.send(note);
    } else {
	res.send("{}");
    }
});

app.listen(3000);
