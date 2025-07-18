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
