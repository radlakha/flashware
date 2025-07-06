import type { NextApiRequest, NextApiResponse } from 'next';
import pool from '../../lib/db';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method Not Allowed' });
  }

  const { title, description, source_url } = req.body;

  if (!title) {
    return res.status(400).json({ error: 'Title is required' });
  }

//   try {
//     const result = await pool.query(
//       'INSERT INTO bok (title, description, source_url) VALUES ($1, $2, $3) RETURNING *',
//       [title, description, source_url]
//     );
//     res.status(200).json(result.rows[0]);
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: 'Something went wrong' });
//   }
// }
try {
  console.log('Inserting:', { title, description, source_url });
  const result = await pool.query(
    'INSERT INTO bok (title, description, source_url) VALUES ($1, $2, $3) RETURNING *',
    [title, description, source_url]
  );
  console.log('Insert result:', result.rows[0]);
  res.status(200).json(result.rows[0]);
} catch (error) {
  console.error('DB ERROR:', error);
  res.status(500).json({ error: 'Something went wrong' });
}
}