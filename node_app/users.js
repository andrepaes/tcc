const express = require('express');
const router = express.Router()
const pool = require('./pool')

router.get('/api/users', getUsers, async (req, res) => {
  res.json({"response": "ok"})
})

async function getUsers(req, res, next) {
  await pool.query('SELECT id FROM users')

  next();
}


module.exports = router
