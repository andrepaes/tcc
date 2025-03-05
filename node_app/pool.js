const pg = require('pg')
const pool = new pg.Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'elixir_app_dev',
  password: 'postgress',
  port: 5432,
  poolSize: 100
})

module.exports.query = (text, values) => {
  return pool.query(text, values)
}
