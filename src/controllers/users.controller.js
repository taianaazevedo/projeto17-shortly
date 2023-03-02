import { db } from "../database/database.connection.js";

export async function getUsers(req, res){
    const { authorization } = req.headers

    const token = authorization?.replace("Bearer ", '')

    if (!token) return res.status(401).send("Informe o token!")
    try {
        const findUser = await db.query(`
        SELECT * FROM sessions 
        WHERE user_token = $1
        `, [token])

        if(findUser.rowCount === 0) return res.status(401).send("Você não está logado")

        const id = findUser.rows[0].user_id

        const allUrls = await db.query(`
        SELECT url.url, url.id, url."visitCount", url."shortUrl" 
        FROM url 
        WHERE user_id = $1
        `, [id])

        const urlOwner = await db.query(`
        SELECT * FROM users 
        WHERE id = $1
        `, [id])

        const sumVisit = await db.query(`
        SELECT SUM("visitCount") AS total 
        FROM url
        WHERE user_id = $1
        `, [id])


        return res.status(200).send({
            id: urlOwner.rows[0].id,
            name: urlOwner.rows[0].name,
            visitCount: sumVisit.rows[0].total,
            shortenedUrls: allUrls.rows                            
        })
        
        
    } catch (error) {
        return res.status(500).send(error.message);
    }
}