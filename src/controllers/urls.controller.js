import { db } from "../database/database.connection.js";
import { nanoid } from 'nanoid';

export async function createShortUrl(req, res){
    const { authorization } = req.headers
    const { url } = req.body

    const token = authorization?.replace("Bearer ", '')

    if (!token) return res.status(401).send("Informe o token!")

    try {
        const shortUrl = nanoid(7)

        const findUser = await db.query(`
        SELECT * FROM sessions 
        WHERE user_token = $1
        `, [token])

        await db.query(`
        INSERT INTO url (user_id, url, short_url) 
        VALUES ($1, $2, $3)
        `, [findUser.rows[0].user_id, url, shortUrl])

        const idUrl = await db.query(`
        SELECT * FROM url
        WHERE url = $1
        `, [url])

       return res.status(201).send({id: idUrl.rows[0].id, shortUrl: idUrl.rows[0].short_url})
        
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function getUrlById(req, res){

}

export async function getOpenUrl(req, res){

}

export async function deleteUrlById(req, res){
    
}