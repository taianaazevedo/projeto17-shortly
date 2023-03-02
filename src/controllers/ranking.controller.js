import { db } from "../database/database.connection.js";

export async function getRanking(req, res){
    try {
        const ranking = await db.query(`
        SELECT users.name, users.id, 
        COUNT(url.url) AS "linksCount", 
        SUM(url."visitCount") AS "visitCount"
        FROM url
        LEFT JOIN users ON url.user_id = users.id
        GROUP BY url.user_id, users.name, users.id
        ORDER BY "visitCount" DESC
        LIMIT 10
        `)
      
        return res.status(200).send(ranking.rows)
    } catch (error) {
        return res.status(500).send(error.message);
    }
    
}