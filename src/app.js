import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import routes from './routes/app.route.js'

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());
app.use(routes)

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Server running in port: ${port}`));