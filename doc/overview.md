# Flashware — Project Overview

## 📚 Vision

Flashware is a personal and shareable flashcard system that helps learners anchor study sessions to real knowledge sources (Bodies of Knowledge, or BoKs), break them into Decks of Cards, and track learning progress with Runs — all fully owned and controlled by the User.

## 🎯 Core Entities

### 1️⃣ User
- Owns BoKs, Decks, Cards, Runs.
- May share/publish BoKs and Decks for others to use.

### 2️⃣ BoK (Body of Knowledge)
- Defines a source anchor (book, article, course).
- Attributes: `id`, `user_id`, `title`, `description` (optional), `source_url` (informational).

### 3️⃣ Deck
- Belongs to **one BoK**.
- Contains many Cards.
- Attributes: `id`, `bok_id`, `user_id`, `title`, `source_url` (informational), `tags` (future).

### 4️⃣ Card
- Belongs to **one Deck**.
- Attributes: `id`, `deck_id`, `question`, `option_a`–`option_d`, `correct_answer`.

### 5️⃣ Run
- Records a single study session.
- Initially tied to a Deck; later can run across a whole BoK or a Tag.
- Attributes: `id`, `user_id`, `deck_id` (or BoK/Tag in future), `start_time`, `end_time`, `cards_played`, `results`.

### 6️⃣ Tags (Future)
- Link Decks across BoKs for mixed study sessions.

## 🔑 Key Principles
- Import source questions once when creating a Deck.
- No sync — the source URL is informational only.
- User is root owner — BoKs, Decks, Cards, Runs.
- Publishing is explicit — no Runs are shared.

## 🗂️ Storage
- PostgreSQL for structured storage.
- Starts as a simple RDBMS; grows with features.
