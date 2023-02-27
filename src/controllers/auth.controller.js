import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt"
import { v4 as uuidV4 } from "uuid"

export async function signIn(req, res){
    const {email, password} = req.body

    try {
        const userExist = await db.query(`
        SELECT * FROM users 
        WHERE email = $1`, [email])

        if(userExist.rowCount === 0) return res.status(401).send("Usuário ou senha incorretos")

        const comparePassword = bcrypt.compareSync(password, userExist.password)

        if (!comparePassword) return res.status(401).send("Usuário ou senha incorretos")


    } catch (error) {
        res.status(500).send(error.message);
    }
}



export async function signUp(req, res){
    const { name, email, password } = req.body

    const hashPassword = bcrypt.hashSync(password, 10)

    try {
        const userExists = await db.query(`
        SELECT * FROM users 
        WHERE email = $1`, [email])

        if(userExists.rowCount > 0) return res.status(409).send("Esse cpf já está cadastrado")

        await db.query(
            `INSERT INTO users (name, email, password) 
            VALUES ($1, $2, $3)`,
            [name, email, hashPassword]
          );
      
          res.status(201).send("Cliente cadastrado com sucesso!");

    } catch (error) {
        res.status(500).send(error.message);
    }
}