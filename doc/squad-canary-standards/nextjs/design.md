# Next.js Design Standards

Detailed architectural and design principles for Next.js components, adapted for full-stack with Supabase and Vercel.

## Domain Modeling
- Use TypeScript types/interfaces for data shapes; validate with Zod.
- FP Patterns: Use Ramda or lodash/fp for functors, monads (e.g., Option type for nullables).

## System Architecture
- Do not use App Router for this project. 
- Pages Router: Use for API routes; keep logic in Server Actions.
- Layering: Separate UI (components), logic (actions/hooks), data (lib/supabase.ts).
- State Management: Built-in useState/useReducer for local; React Query or SWR for data fetching.

## Common Patterns
- Server Actions: For mutations (e.g., form submissions to Supabase).
- Streaming: Use Suspense boundaries for partial rendering.
- Authentication: Use Supabase Auth Helpers for Next.js; protect routes with middleware.
- UI Composition: ShadCN components; theme with Tailwind CSS.
- Deployment: Vercel for auto-deploys; use env vars for Supabase keys.

Additional Design Details:
- Scalability: Design for ISR/SSG where possible; use Edge Functions for low-latency.
- Security: Enable RLS in Supabase; avoid exposing keys client-side.
- Optimization: Monitor with Vercel Analytics; use Speed Insights.

Examples:
- Folder Structure: /app for routes, /components/ui for ShadCN, /lib for utilities.
- Middleware: Check auth on protected paths.

Modify with squad patterns.
