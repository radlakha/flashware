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
```tsx
interface Props { name: string; }

const Greeting: React.FC<Props> = ({ name }) => <div>Hello, {name}</div>;
```

Modify as needed.
