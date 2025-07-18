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
