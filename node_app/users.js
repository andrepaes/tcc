const express = require('express');
const router = express.Router()


router.get('/api/users', getUsers, async (req, res) => {
  res.json({"response": "ok"})
})

async function getUsers(req, res, next) {
  await new Promise(resolve => setTimeout(resolve, 300));
  next();
}


module.exports = router
