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
- **Request Flow**: User request -> Next.js page (SSR with getServerSideProps) -> Supabase query/mutation -> Response. For APIs: /pages/api/[endpoint].ts handles logic.
- **Security**: RLS in Supabase; middleware or checks in code for auth. This is not in scope of the MVP release but should be considered for future iterations.

No Supabase functions/procedures; schema mods via direct SQL if needed. Align tasks with this architecture.
