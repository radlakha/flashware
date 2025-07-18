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
