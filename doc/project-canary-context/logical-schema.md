# Logical Schema for Flashware

Data entities and relationships in Supabase (as data store only; schema extensions via migrations, dashboard, or SQL like init.sql).

## Key Entities
- **Users** (built-in Supabase auth.users table): id (uuid primary key), email (string), created_at (timestamp), etc. Managed by Supabase Auth with Google OAuth.
- **BoK (Body of Knowledge)** (custom table: bok): id (serial primary key; consider uuid for consistency), user_id (int or uuid foreign key to auth.users.id; nullable for now, but enforce non-null in prod), title (text not null), description (text optional), source_url (text optional).
- **Deck** (custom table): id (uuid primary key), bok_id (uuid foreign key to bok.id), user_id (uuid foreign key to auth.users.id), title (text not null), source_url (text optional), tags (jsonb or array for future; e.g., string[]).
- **Card** (custom table): id (uuid primary key), deck_id (uuid foreign key to deck.id), question (text not null), option_a (text), option_b (text), option_c (text), option_d (text), correct_answer (char(1) check in 'a','b','c','d' not null).
- **Run** (custom table): id (uuid primary key), user_id (uuid foreign key to auth.users.id), deck_id (uuid foreign key to deck.id; optional for future BoK/Tag), start_time (timestamp not null), end_time (timestamp), cards_played (integer), results (jsonb for scores/details).
- **Tags** (future custom table or embedded): id (uuid primary key), name (text unique), or as jsonb in deck for initial simplicity.

## Relationships
- One-to-Many: User owns many BoKs (via user_id fk).
- One-to-Many: BoK has many Decks (via bok_id fk).
- One-to-Many: Deck has many Cards (via deck_id fk).
- One-to-Many: User has many Runs (via user_id fk); Run links to Deck (via deck_id fk; extend for BoK/Tag).
- Many-to-Many (future): Decks to Tags (via junction table if needed).

## Schema Management
- Extensions/Mods: Start with init.sql for bok; add tables via Supabase dashboard or SQL migrations in code (e.g., for deck, card). Use UUID extensions if switching from serial.
- Constraints: Foreign keys with on delete cascade where appropriate (e.g., delete Deck cascades to Cards); unique on user_id + title for BoKs if desired.
- RLS: Enable for all custom tables (e.g., row access where user_id = auth.uid() to enforce ownership).
- Storage: PostgreSQL; use jsonb for flexible fields like results or tags initially.

Full details viewable in Supabase dashboard. Reference when breaking down stories involving data. Modify as project evolves.