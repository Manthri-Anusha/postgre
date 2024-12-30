import { Client } from 'pg';

export default async function handler(req, res) {
  const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'mydatabase',
    password: 'Anusha@400',
    port: 5432,
  });

  try {
    await client.connect();
    const result = await client.query('SELECT NOW()');
    res.status(200).json({ time: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: error.message });
  } finally {
    await client.end();
  }
}