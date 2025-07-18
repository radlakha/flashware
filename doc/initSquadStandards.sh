#!/bin/bash

# Script to create squad-standards directory structure and starter files
# Run from the root of the repo

# Create main folder
mkdir -p squad-standards

# Create top-level coding-standards.md
cat << EOF > squad-standards/coding-standards.md
# Squad Coding Standards (Shared)

This document outlines shared coding standards applicable across all languages in our squad, with a focus on functional programming (FP) paradigms.

## Core FP Paradigms
- **Immutability**: Always prefer immutable data structures to avoid side effects.
- **Pure Functions**: Functions should be pure—same input always yields same output, no side effects.
- **Composition**: Favor function composition over inheritance or complex classes.
- **Higher-Order Functions**: Use map, filter, reduce, and similar for data transformations.

## General Rules
- **Error Handling**: Use explicit error types (e.g., monads or tagged unions) instead of exceptions where possible.
- **Testing**: Aim for at least 80% code coverage with unit tests; include property-based testing for FP code.
- **Version Control**: Commit messages follow Conventional Commits; keep commits atomic.
- **Cross-Language Integration**: Define clear API contracts (e.g., JSON schemas) for backend-frontend communication.

Modify this file as needed for squad-specific updates.
EOF

# Create clojure subfolder and files
mkdir -p squad-standards/clojure

# Clojure standards.md
cat << EOF > squad-standards/clojure/standards.md
# Clojure Coding Standards

Specific guidelines for Clojure code in our squad, building on shared FP standards.

## Naming and Organization
- Namespaces: Use kebab-case (e.g., my-project.core).
- Functions/Vars: kebab-case, descriptive names (e.g., process-user-data).

## FP in Clojure
- Use core functions like map, filter, reduce.
- Prefer transducers for efficient transformations.
- Immutability: Leverage persistent data structures (vectors, maps).

## Tools and Best Practices
- Linting: Use clj-kondo.
- Specs: Define specs for functions and data shapes using clojure.spec.
- Error Handling: Use try/catch sparingly; prefer Maybe or Either patterns.

## Example
\`\`\`clojure
(defn pure-add [x y]
  (+ x y))
\`\`\`

Modify as needed.
EOF

# Clojure design.md
cat << EOF > squad-standards/clojure/design.md
# Clojure Design Standards

Architectural and design principles for Clojure components.

## Domain Modeling
- Use maps and records for data; specs for validation.
- FP Patterns: Functors, applicatives, monads (e.g., via cats library if approved).

## System Architecture
- Modular: Break into small namespaces; use component or integrant for system wiring.
- Concurrency: Prefer core.async channels over threads.

## Common Patterns
- Event Sourcing: Store events immutably, derive state via reductions.
- API Design: RESTful with JSON; use ring/compojure.

Modify with squad examples.
EOF

# Create frontend subfolder and files
mkdir -p squad-standards/frontend

# Frontend standards.md
cat << EOF > squad-standards/frontend/standards.md
# Frontend (React + TypeScript) Coding Standards

Guidelines for React and TypeScript code, emphasizing FP.

## Naming and Organization
- Components: PascalCase (e.g., UserProfile).
- Files: kebab-case for folders, PascalCase for component files.

## FP in Frontend
- Functional Components: Use hooks; avoid class components.
- Immutability: Use spread operators or libraries like Immer for state updates.
- Pure Functions: Render functions should be pure.

## TypeScript Specifics
- Interfaces/Types: Define for props, state, and APIs.
- Strict Typing: Enable strict mode in tsconfig.

## Tools and Best Practices
- Linting: ESLint with react-hooks and typescript-eslint plugins.
- State Management: Redux or Context with reducers for FP-style updates.

## Example
\`\`\`tsx
interface Props { name: string; }

const Greeting: React.FC<Props> = ({ name }) => <div>Hello, {name}</div>;
\`\`\`

Modify as needed.
EOF

# Frontend design.md
cat << EOF > squad-standards/frontend/design.md
# Frontend (React + TypeScript) Design Standards

Design principles for frontend architecture.

## Component Design
- Compound Components: Compose small, reusable parts.
- Hooks: Custom hooks for logic reuse (e.g., useFetch).

## FP Patterns
- Memoization: Use React.memo and useMemo for performance.
- Composition: Higher-order components or render props.

## Architecture
- Layering: Separate concerns (UI, logic, data fetching).
- State: Global with Redux (immutable reducers); local with useState/useReducer.

## Common Patterns
- Error Boundaries: For robust handling.
- Routing: Use react-router with lazy loading.

Modify with squad patterns.
EOF

echo "Squad standards directory structure and starter files created successfully!"