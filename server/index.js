require('dotenv').config({ path: './dev.env'})

const http = require('http')
const pg = require('pg')

const pool = new pg.Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: parseInt(process.env.DB_PORT),
})

const handler = async (req, res) => {
    const body = { ok: true }
    let queryObj = {}
    if (req.url.includes('?')) {
        const queryString = req.url.substring([...req.url].indexOf('?') + 1)
        const queryStringSplit = queryString.split('&')
        queryStringSplit.forEach((param) => {
            const [key, value] = param.split('=')
            queryObj[key] = value
        })
    }
    console.log(req.method + ' ' + req.url + ' ')
    if (req.url === '/') {
        res.status = 200
        res.end(JSON.stringify(body))
    } else if (req.url.startsWith('/ingredients')) {
        const { rows } = await pool.query(`SELECT * FROM ingredients where id = $1`, [queryObj.id]);
        res.status = 200
        res.end(JSON.stringify({ ...body, rows }))
    }
}

const server = http.createServer(handler)

server.listen(3000, () => {
    console.log('Server is running...')
})
