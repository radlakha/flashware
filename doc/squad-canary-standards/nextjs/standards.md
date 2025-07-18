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
```tsx
import { Suspense } from 'react';

interface UserProps { id: string; }

async function fetchUser(id: string) {
  // Pure fetch function
  const res = await fetch(`/api/users/${id}`);
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
```

Additional Best Practices:
- Modular Structure: Group by feature (e.g., /app/users/components, /app/users/actions).
- API Routes: Secure with middleware; validate inputs with Zod.
- Performance: Use dynamic() for lazy loading; optimize with next/dynamic.

Modify as needed.
