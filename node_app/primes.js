const express = require('express');
const router = express.Router()


router.get('/api/primes/:quantity', getPrimes, async (req, res) => {
  res.json(res.locals.primes)
})

async function getPrimes(req, res, next) {
  const n = req.params.quantity;
  console.log(n)
  var array_of_primes=[];
  for(var i = 2; i <= n/2; i++){
    if(isPrime(i)) array_of_primes.push(i);
  }
   res.locals.primes = array_of_primes;
  next();
}

function isPrime(num) {
  for(var i = 2; i < num; i++)
    if(num % i === 0) return false;
  return true;
}


module.exports = router
