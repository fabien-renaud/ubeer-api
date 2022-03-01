import express from 'express';
import jwt from 'jsonwebtoken';

const PAYLOAD = {role: 'dev@ubeer.io'};
const SECRET_KEY = 'abcdefghijklmnopqrstuvwxyz0123456789';
const JWT_ALG = 'HS256';

const TOKEN = {
    token: jwt.sign(PAYLOAD, SECRET_KEY, {algorithm: JWT_ALG}),
    refresh_token: 'refresh'
};

const server = express();
server.set('port', parseInt(process.env.PORT, 10) || 13000);
server.use(express.json());
server.use(express.urlencoded({extended: true}));

// We shouldn't get token through GET endpoint, but it is easier to retrieve one from browser
server.get('/login', (request, response) => response.send(TOKEN));
server.get('/token', (request, response) => response.send(TOKEN));
server.get('/refresh/token', (request, response) => response.send(TOKEN));

server.post('/login', (request, response) => response.send(TOKEN));
server.post('/token', (request, response) => response.send(TOKEN));
server.post('/refresh/token', (request, response) => response.send(TOKEN));

server.listen(server.get('port'), () => console.log(`Server is listening at ${server.get('port')}`));
