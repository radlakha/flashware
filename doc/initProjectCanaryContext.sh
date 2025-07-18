#!/bin/bash

# Script to create project-canary-context directory structure and detailed files
# Adapted for Next.js pilot (Pages Router) with Supabase (data store only), Vercel, ShadCN
# Run from the root of the repo

# Create main folder
mkdir -p project-canary-context

# Create overview.md
cat << EOF > project-canary-context/overview.md
# Project Overview

This is a Next.js app (using Pages Router) for user profile management, deployed on Vercel with Supabase as the backend data store (including auth and realtime). No separate backend server; all logic in TypeScript code.

## Key Objectives
- Provide secure, real-time profile viewing, editing, and management for users (target: 10k+ users).
- Emphasize functional programming where possible (immutability, pure functions) per squad-canary-standards.
- UI consistency via ShadCN components; fast deploys on Vercel.

## Tech Stack
- Frontend/Full-Stack: Next.js 14+ (Pages Router for routing and API routes).
- Database: Supabase (PostgreSQL-based; connect via env URL in Vercel, e.g., POSTGRES_URL).
- Deployment: Vercel (auto-deploys from Git; use env vars for Supabase keys).
- Auth: Supabase Auth (JWT-based).
- Realtime: Supabase subscriptions for live updates.
- Testing: Cypress for e2e; Jest for units.

Modify as project evolves.
EOF

# Create roadmap.md
cat << EOF > project-canary-context/roadmap.md
# Project Roadmap

High-level phases and milestones for the Next.js pilot app.

## Phase 1: MVP Core Features (Current Focus)
- Implement user auth, profile CRUD operations via Supabase.
- Basic UI with ShadCN components.
- Timeline: Q3 2025; prioritize essential stories for demo.

## Phase 2: Enhancements
- Add realtime updates (e.g., profile sync across devices).
- Performance optimizations (e.g., ISR/SSG in Pages Router).
- Timeline: Q4 2025; integrate analytics.

## Phase 3: Scaling and Polish
- User analytics, notifications.
- Full test coverage, CI/CD refinements.
- Timeline: Q1 2026; production readiness.

## General Principles
- Align with business goals: User retention via seamless profiles.
- Avoid scope creep: Validate against objectives in overview.md.
- Review in Scrum retros: Adjust based on pilot feedback.

Update with progress.
EOF

# Create logical-schema.md
cat << EOF > project-canary-context/logical-schema.md
# Logical Schema

Data entities and relationships in Supabase (as data store only; schema extensions via migrations or dashboard).

## Key Entities
- **Users** (built-in auth.users table): id (uuid), email (string), created_at (timestamp), etc. Managed by Supabase Auth.
- **Profiles** (custom table): user_id (uuid foreign key to auth.users.id), bio (text), avatar_url (string), updated_at (timestamp).
- **Additional Tables** (as needed): e.g., Settings (user_id fk, preferences jsonb).

## Relationships
- One-to-One: Users to Profiles (via user_id fk; enforce with RLS policies on user_id = auth.uid()).
- Future: One-to-Many if adding posts/comments.

## Schema Management
- Extensions/Mods: Handle as tasks (e.g., add columns via Supabase dashboard or SQL migrations in code).
- Constraints: Unique on user_id; indexes on frequent queries (e.g., user_id).
- RLS: Enable for all custom tables to restrict access.

Full details viewable in Supabase dashboard. Reference when breaking down stories involving data.
EOF

# Create logical-architecture.md
cat << EOF > project-canary-context/logical-architecture.md
# Logical Architecture

High-level structure and flows for the Next.js app.

## Components
- **Frontend**: Next.js Pages Router (/pages/ for routes, /components/ for ShadCN UI).
- **Backend/Data**: Supabase as data store (connect via Vercel env URL, e.g., process.env.SUPABASE_URL and SUPABASE_KEY; use @supabase/supabase-js client).
- **Logic**: All in TypeScript (e.g., in /pages/api/ for endpoints, or directly in pages for server-side props).
- **Deployment**: Vercel (git-based deploys; env vars for Supabase connection; supports SSR/SSG).

## Connections and Flows
- **Data Access**: Frontend connects directly to Supabase via client (server-side in getServerSideProps or API routes to avoid exposing keys). E.g., const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_ANON_KEY).
- **Auth Flow**: Supabase Auth in /pages/api/auth; sessions managed client/server-side.
- **Realtime**: Subscriptions in client components (e.g., supabase.channel() for profile updates).
- **Request Flow**: User request -> Next.js page (SSR with getServerSideProps) -> Supabase query/mutation -> Response. For APIs: /pages/api/[endpoint].ts handles logic.
- **Security**: RLS in Supabase; middleware or checks in code for auth.

No Supabase functions/procedures; schema mods via direct SQL if needed. Align tasks with this architecture.
EOF

# Create task-archetypes.md
cat << EOF > project-canary-context/task-archetypes.md
# Task Archetypes

Standard categories for breaking down user stories into tasks. Use these to structure AI-assisted decompositions.

- **Schema Task**: Modify/extend Supabase schema (e.g., add columns/tables via dashboard or SQL; update RLS).
- **API Task**: Implement data endpoints (e.g., /pages/api/profile.ts for queries/mutations using Supabase client).
- **Frontend Task**: Build UI/pages/components (e.g., /pages/profile.tsx with ShadCN; handle state/logic in TS).
- **Test Case Task**: Write unit/integration tests (e.g., Jest for components/API; mock Supabase).
- **Automation Task**: Set up e2e tests or scripts (e.g., Cypress for UI flows; CI in Vercel).

Each task: Include dependencies, and alignment with acceptance criteria. Reference in breakdowns for consistency.
EOF

echo "Project canary context directory structure and detailed files created successfully!"