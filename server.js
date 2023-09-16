import express from 'express';
import cors from 'cors';

const app = express();
const port = 3000;

app.use(cors());
app.get('/', (req, res) => {
  res.send({"users": ['userOne', 'userTwo','userTree', 'userFour']}); 
});

app.listen(port, () => {
  console.log(`Servidor Express escuchando en http://localhost:${port}`);
});