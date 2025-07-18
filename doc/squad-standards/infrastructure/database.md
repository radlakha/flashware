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
```clojure
(require '[next.jdbc :as jdbc])

(defn fetch-users [db-spec]
  (jdbc/execute! db-spec ["SELECT * FROM users"]))
```

Modify with squad-specific DB details (e.g., PostgreSQL schemas).
