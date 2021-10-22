const express = require('express');

const app = express();
const endpoint = "/notes";

app.use(endpoint, express.json());


var cors = require('cors')
app.use(cors())

app.get('/', (req, res) => {
    res.send("Culpa do Cliente");
});

const notes = [
    {title : "Primeiro Título", description : "Essa é a primeira Descrição!"},
    {title : "Segundo Título", description : "Culpa do Cliente"}
];



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

app.post(endpoint, (req, res) => {
    const note = {
	title : req.body["title"],
	description :  req.body["description"]
    }
    notes.push(note);
    res.send('1');
    notify(notes.length, note["title"], note["description"]);
});

app.put(`${endpoint}/:id`, (req, res) => {

    const id = req.params.id;
    const note = {
	title : req.body["title"],
	description :  req.body["description"]
    }
    notes[id] = note;

    res.send("1");
    notify(parseInt(id), note["title"], note["description"]);
});

app.delete(`${endpoint}/:id`, (req,res) => {
    const id = req.params.id;
    console.log(id);
    delete notes[id];
    res.send('1');

    notify(parseInt(id), "", "");
});

/*
  Stream
*/

let SERVER_INFORMATION = 'server_information';

//app.listen(3000);
var server = require('http').createServer(app);
var io = require('socket.io')(server);
server.listen(3000);

function notify(noteId, title, description){
    console.log(title);
    io.sockets.emit(SERVER_INFORMATION,
		    {
			"noteId" : noteId,
			"title" : title,
			"description" : description
		    }
		   );
}
