const cluster = require('cluster');
const os = require('os');
const express = require('express');
const usersRoutes = require('./users')
const primesRoutes = require('./primes')

const numCPUs = os.availableParallelism();
const PORT = process.env.PORT || 4000;

if (cluster.isMaster) {
  console.log(numCPUs)
  console.log(`Master process ${process.pid} is running`);

  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`Worker process ${worker.process.pid} died. Restarting...`);
    cluster.fork();
  });
} else {
  const app = express();

  app.use(usersRoutes);
  app.use(primesRoutes);

  app.listen(PORT, () => {
    console.log(`Worker process ${process.pid} is listening on port ${PORT}`);
  });
}
