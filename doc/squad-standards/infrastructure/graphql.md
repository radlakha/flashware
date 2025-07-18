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
```clojure
(def schema
  {:queries {:user {:type :User
                    :args {:id {:type :ID}}
                    :resolve :resolve-user}}})
```

Expand with full schemas.
