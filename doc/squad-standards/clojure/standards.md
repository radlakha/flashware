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
```clojure
(defn pure-add [x y]
  (+ x y))
```

Modify as needed.
