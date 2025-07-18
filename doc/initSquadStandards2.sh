#!/bin/bash

# Script to create infrastructure subfolder and starter files in squad-standards,
# plus ai-prompt-patterns.md at top level.
# Run from the root of the repo.
# Assumes squad-standards/ already exists.

# Create infrastructure subfolder
mkdir -p squad-standards/infrastructure

# Create database.md
cat << EOF > squad-standards/infrastructure/database.md
# Database Access Standards

Guidelines for accessing databases in our squad, with FP emphasis.

## Preferred Tools
- Clojure: Use next.jdbc or honeysql for queries; connection pooling with HikariCP.
- Frontend: Avoid direct DB access; use APIs (e.g., GraphQL).

## Best Practices
- Parameterized Queries: Always use to prevent SQL injection.
- Immutability: Map results to immutable Clojure maps or records.
- Error Handling: Use try/catch or monads for failures.

## FP Tips
- Treat queries as pure functions: Input params, output data structures.
- Caching: Use memoization for repeated reads.

## Example (Clojure)
\`\`\`clojure
(require '[next.jdbc :as jdbc])

(defn fetch-users [db-spec]
  (jdbc/execute! db-spec ["SELECT * FROM users"]))
\`\`\`

Modify with squad-specific DB details (e.g., PostgreSQL schemas).
EOF

# Create kafka.md
cat << EOF > squad-standards/infrastructure/kafka.md
# Kafka Standards

Best practices for Kafka integration, focusing on FP paradigms.

## Preferred Tools
- Clojure: Use kafka-clj or Jackdaw library for producers/consumers.
- Configuration: Use schema registry for Avro/JSON schemas.

## Best Practices
- Producers: Ensure idempotency with unique keys.
- Consumers: Handle offsets manually for exactly-once semantics.
- Security: Use SSL and ACLs.

## FP Tips
- Events as Immutable: Treat messages as immutable data; use reductions for state derivation.
- Stream Processing: Leverage Kafka Streams with functional transformations.

## Example (Clojure)
\`\`\`clojure
(require '[jackdaw.client :as jc])

(defn produce-event [producer topic event]
  (jc/produce! producer {:topic topic} nil event))
\`\`\`

Add squad topics and configs.
EOF

# Create graphql.md
cat << EOF > squad-standards/infrastructure/graphql.md
# GraphQL Standards

Standards for GraphQL APIs and clients.

## Backend (Clojure)
- Library: Use Lacinia for schema and resolvers.
- Schema Design: Define types with immutable fields; avoid mutations where possible.

## Frontend (React/TS)
- Client: Apollo Client or urql.
- Queries: Use hooks like useQuery for functional data fetching.

## Best Practices
- Authentication: JWT or similar in headers.
- Error Handling: Standardized error formats.

## FP Tips
- Resolvers as Pure Functions: Input context/args, output data.
- Composition: Compose queries and fragments.

## Example (Clojure Schema Snippet)
\`\`\`clojure
(def schema
  {:queries {:user {:type :User
                    :args {:id {:type :ID}}
                    :resolve :resolve-user}}})
\`\`\`

Expand with full schemas.
EOF

# Create ai-prompt-patterns.md at top level
cat << EOF > squad-standards/ai-prompt-patterns.md
# AI Prompt Patterns

Collection of effective prompt templates for Gemini Chat and Copilot modes. Add new ones as discovered.

## General Structure
- Always reference standards: "Follow squad-standards/coding-standards.md and [language]/standards.md."
- Be specific: Include examples, constraints, and desired output format.

## Examples
1. Code Suggestion: "Suggest a Clojure function for fetching users from DB, adhering to squad-standards/infrastructure/database.md and clojure/standards.md. Output as code block."
2. Design Brainstorm: "Outline a functional architecture for a React component handling Kafka events, following frontend/design.md."
3. Debugging: "Analyze this error in TypeScript: [paste error]. Suggest fixes per squad-standards."
4. Test Generation: "Generate unit tests for this Clojure function: [paste code]. Use FP style."

Add more patterns here for reuse.
EOF

echo "Infrastructure subfolder, starter files, and ai-prompt-patterns.md created successfully!"