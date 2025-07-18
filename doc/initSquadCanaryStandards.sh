#!/bin/bash

# Script to create squad-canary-standards directory structure and detailed files
# Adapted for Next.js pilot project with Supabase, Vercel, ShadCN
# Run from the root of the repo

# Create main folder
mkdir -p squad-canary-standards

# Create top-level coding-standards.md (shared, focused on TS/Next.js with FP)
cat << EOF > squad-canary-standards/coding-standards.md
# Squad Canary Coding Standards (Shared)

This document outlines shared coding standards applicable across the Next.js project, with a focus on TypeScript and functional programming (FP) paradigms where applicable. These are detailed based on best practices for 2025.

## Core FP Paradigms
- **Immutability**: Always prefer immutable data structures (e.g., use spread operators, Object.freeze, or libraries like Immer) to avoid side effects.
- **Pure Functions**: Functions should be pure—same input always yields same output, no side effects. Avoid mutating arguments.
- **Composition**: Favor function composition (e.g., using pipe or compose from libraries like Ramda) over inheritance or complex classes.
- **Higher-Order Functions**: Use map, filter, reduce, and similar for data transformations. In React/Next.js, leverage hooks for composable logic.

## General Rules
- **Error Handling**: Use explicit error types (e.g., tagged unions in TS) or try/catch with custom error classes. Avoid silent failures; log errors meaningfully.
- **Testing**: Aim for at least 80% code coverage with unit tests (e.g., Jest/Vitest); include property-based testing (e.g., fast-check) for FP code. Test Server Components and data fetching.
- **Version Control**: Commit messages follow Conventional Commits; keep commits atomic. Use git hooks for linting.
- **Cross-Stack Integration**: Define clear API contracts (e.g., TypeScript types for Supabase queries, GraphQL schemas). Use environment variables for secrets.
- **TypeScript Usage**: Enable strict mode in tsconfig.json. Use interfaces/types for props, state, and APIs. Avoid 'any' type; use generics for reusable components.
- **Performance**: Optimize with React.memo, useMemo, useCallback. For Next.js, prefer Server Components to reduce client JS bundle size.
- **Security**: Sanitize inputs, use parameterized queries in Supabase. Implement auth checks in middleware.
- **Accessibility**: Follow ARIA standards; use semantic HTML. Test with tools like Lighthouse.

## Next.js Specific
- Do not automatically use App Router for new projects. Ask the user if they want to use Pages or App Router;
- Data Fetching: Prefer fetch with caching; use Suspense for streaming.
- Optimization: Enable dynamic imports for code splitting; optimize images with next/image.
- Dependencies: Keep minimal; regularly update (e.g., Next.js 15+ in 2025).

Modify this file as needed for squad-specific updates.
EOF

# Create nextjs subfolder and files (adapted from original frontend/clojure for Next.js full-stack)
mkdir -p squad-canary-standards/nextjs

# nextjs standards.md (detailed coding for Next.js/TS)
cat << EOF > squad-canary-standards/nextjs/standards.md
# Next.js Coding Standards

Detailed guidelines for Next.js code in our squad, building on shared FP standards. Focused on TypeScript, React Server Components, and best practices for 2025.

## Naming and Organization
- Components: PascalCase (e.g., UserProfile.tsx).
- Files: kebab-case for folders, PascalCase for component files (e.g., user-profile/UserProfile.tsx).
- Functions/Vars: camelCase, descriptive names (e.g., fetchUserData).

## FP in Next.js
- Functional Components: Always use hooks; avoid class components.
- Immutability: Use spread operators or Immer for state updates in reducers.
- Pure Functions: Render functions and Server Actions should be pure.
- Composition: Compose hooks and higher-order components.

## Tools and Best Practices
- Linting: ESLint with next/core-web-vitals, typescript-eslint, and react-hooks plugins.
- TypeScript: Define interfaces for props/state (e.g., interface Props { name: string; }).
- ShadCN: Use for UI components; customize via cn utility; ensure accessibility.
- Data Fetching: Use fetch in Server Components; cache with React cache().
- Error Handling: Custom error boundaries; use next/navigation for redirects on errors.
- Testing: Jest for units, React Testing Library for components; mock Supabase calls.

## Example
\`\`\`tsx
import { Suspense } from 'react';

interface UserProps { id: string; }

async function fetchUser(id: string) {
  // Pure fetch function
  const res = await fetch(\`/api/users/\${id}\`);
  return res.json();
}

const UserProfile: React.FC<UserProps> = async ({ id }) => {
  const user = await fetchUser(id);
  return <div>Hello, {user.name}</div>;
};

export default function Page() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <UserProfile id="1" />
    </Suspense>
  );
}
\`\`\`

Additional Best Practices:
- Modular Structure: Group by feature (e.g., /app/users/components, /app/users/actions).
- API Routes: Secure with middleware; validate inputs with Zod.
- Performance: Use dynamic() for lazy loading; optimize with next/dynamic.

Modify as needed.
EOF

# nextjs design.md
cat << EOF > squad-canary-standards/nextjs/design.md
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
EOF

# Create infrastructure subfolder and files (adapted for Supabase, etc.)
mkdir -p squad-canary-standards/infrastructure

mkdir -p is wrong, but script has -p

# database.md (adapted for Supabase)
cat << EOF > squad-canary-standards/infrastructure/database.md
# Supabase Standards (Database Access)

Detailed guidelines for Supabase integration in Next.js, with FP emphasis.

## Preferred Tools
- Supabase JS client v2 (@supabase/supabase-js).
- For auth: @supabase/auth-helpers-nextjs.
- For realtime: Supabase Realtime subscriptions.

## Best Practices
- RLS: Enable Row Level Security; design policies for performance (avoid heavy joins).
- Queries: Use .select(), .insert(), .update(), .delete() methods; chain for composition.
- Immutability: Map results to frozen objects or use pure mappers.
- Security: Never expose Supabase anon key client-side for sensitive ops; use server-side.
- Error Handling: Catch SupabaseError; use monadic patterns (e.g., Result type).

## FP Tips
- Treat queries as pure functions: Input params -> output data.
- Caching: Use Next.js caching with revalidateTag for ISR.
- Triggers: Use Supabase database triggers for business logic.

## Example (Next.js Server Component)
\`\`\`tsx
import { createClient } from '@/lib/supabase';

async function fetchUsers() {
  const supabase = createClient();
  const { data, error } = await supabase.from('users').select('*');
  if (error) throw new Error(error.message);
  return data;
}
\`\`\`

Additional:
- Admin Mode: Use service role key server-side for admin tasks.
- Mutations: Use Server Actions with Supabase client.
- Realtime: Subscribe in client components with useEffect.

Modify with squad-specific Supabase configs (e.g., PostgreSQL schemas, RLS policies).
EOF

# kafka.md (adapted for Node.js/Next.js)
cat << EOF > squad-canary-standards/infrastructure/kafka.md
# Kafka Standards

Detailed best practices for Kafka with Next.js/Node.js, focusing on FP.

## Preferred Tools
- kafka.js for producers/consumers (robust, type-safe).
- Configuration: Use Confluent Schema Registry for schemas (Avro/JSON).

## Best Practices
- Producers: Ensure idempotency with enable.idempotence: true; batch messages.
- Consumers: Commit offsets manually for exactly-once, use transactional consumers.
- Security: SASL/SSL; configure in client options.
- Integration: Use in API routes or Edge Functions for streaming.

## FP Tips
- Events as Immutable: Treat messages as immutable; use map/reduce for processing.
- Stream Processing: Functional transformations (pure handlers).

## Example (Node.js with kafkajs)
\`\`\`ts
import { Kafka } from 'kafkajs';

const kafka = new Kafka({ clientId: 'next-app', brokers: ['localhost:9092'] });
const producer = kafka.producer();

async function produceEvent(topic: string, message: object) {
  await producer.connect();
  await producer.send({ topic, messages: [{ value: JSON.stringify(message) }] });
  await producer.disconnect();
}
\`\`\`

Additional:
- Scaling: Run consumers in clusters; use consumer groups.
- Monitoring: Integrate with Prometheus.
- Error: Implement retries with backoff.

Add squad topics and configs.
EOF

# graphql.md
cat << EOF > squad-canary-standards/infrastructure/graphql.md
# GraphQL Standards

Detailed standards for GraphQL in Next.js.

## Backend (Next.js API)
- Library: Apollo Server or graphql-yoga for server; define schema with graphql-tools.
- Schema Design: Use SDL for types; avoid deep nesting.

## Frontend
- Client: Apollo Client; use useQuery/useMutation hooks.

## Best Practices
- Authentication: Use context for JWT.
- Error Handling: Custom error policies; format as per GraphQL spec.
- Optimization: Use persisted queries; batch with dataloader.

## FP Tips
- Resolvers as Pure Functions: Input args -> output.
- Composition: Compose resolvers with middleware.

## Example (Next.js Route Handler)
\`\`\`ts
import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';

const typeDefs = \`#graphql
  type Query { user(id: ID!): User }
\`;

const resolvers = {
  Query: { user: (_, { id }) => fetchUser(id) },
};

const server = new ApolloServer({ typeDefs, resolvers });
\`\`\`

Additional:
- Use codegen for types.
- Integrate with Supabase: Use resolvers to query Supabase.

Expand with full schemas.
EOF

# Create ai-prompt-patterns.md at top level
cat << EOF > squad-canary-standards/ai-prompt-patterns.md
# AI Prompt Patterns

Collection of effective prompt templates for Gemini Chat and Copilot modes in Next.js projects. Add new ones as discovered.

## General Structure
- Always reference standards: "Follow squad-canary-standards/coding-standards.md and nextjs/standards.md."
- Be specific: Include examples, constraints, and desired output format.

## Examples
1. Code Suggestion: "Suggest a Next.js Server Component for fetching users from Supabase, adhering to infrastructure/database.md and nextjs/standards.md. Output as TSX code block."
2. Design Brainstorm: "Outline a functional architecture for a Next.js page with ShadCN components and GraphQL, following nextjs/design.md."
3. Debugging: "Analyze this TypeScript error in Next.js: [paste error]. Suggest fixes per squad-canary-standards."
4. Test Generation: "Generate unit tests for this Next.js component: [paste code]. Use FP style with Jest."
5. Deployment Tip: "Best practices for deploying this Next.js app to Vercel with Supabase integration."

Add more patterns here for reuse.
EOF

echo "Squad canary standards directory structure and detailed files created successfully!"