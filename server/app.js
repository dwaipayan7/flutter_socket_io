import express from 'express';
const app = express();
import http from 'http';
import { Server } from 'socket.io';
import cors from 'cors';

app.use(cors())

const server = http.createServer(app);
const io = new Server(server);

const messages = []; 

io.on('connection', (socket) => {
    console.log("A user connected");

    const username = socket.handshake.query.username || "Anonymous"; 
    console.log("Username:", username);

    socket.on('message', (data) => {
        
        const newMessage = {
            message: data.message,
            senderUsername: username,
            sentAt: Date.now(),
        };

        messages.push(newMessage);

        io.emit('message', newMessage);
    });
});

server.listen(4000, () => {
    console.log("Server Running on port 4000");
});
