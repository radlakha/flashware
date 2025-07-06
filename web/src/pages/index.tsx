import { useState } from 'react';

export default function Home() {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [sourceUrl, setSourceUrl] = useState('');
  const [message, setMessage] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    const res = await fetch('/api/bok', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        title,
        description,
        source_url: sourceUrl,
      }),
    });

    if (res.ok) {
      setMessage('BoK saved! ✅');
      setTitle('');
      setDescription('');
      setSourceUrl('');
    } else {
      const data = await res.json();
      setMessage(`Error: ${data.error}`);
    }
  };

  return (
    <main className="p-4">
      <h1>Create a Body of Knowledge</h1>
      <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1rem', maxWidth: '400px' }}>
        <input
          type="text"
          placeholder="Title"
          required
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <textarea
          placeholder="Description (optional)"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <input
          type="url"
          placeholder="Source URL"
          value={sourceUrl}
          onChange={(e) => setSourceUrl(e.target.value)}
        />
        <button type="submit">Save BoK</button>
      </form>
      {message && <p>{message}</p>}
    </main>
  );
}
