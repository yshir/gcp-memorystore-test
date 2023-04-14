
const functions = require('@google-cloud/functions-framework');
const redis = require('redis');

const REDIS_HOST = process.env.REDIS_HOST || 'localhost';
const REDIS_PORT = process.env.REDIS_PORT || 6379;

const redisClient = redis.createClient({
  socket: {
    host: REDIS_HOST,
    port: REDIS_PORT,
  },
});
redisClient.on('error', err => console.error('ERR:REDIS:', err));
redisClient.connect();

functions.http('visitCount', async (req, res) => {
  try {
    const response = await redisClient.incr('visits');
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(`Visit count: ${response}`);
  } catch (err) {
    console.log(err);
    res.status(500).send(err.message);
  }
});
