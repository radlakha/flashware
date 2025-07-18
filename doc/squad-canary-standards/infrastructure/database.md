# Supabase Standards (Database Access)

Detailed guidelines for Supabase integration in Next.js, with FP emphasis.

## Preferred Tools
- Supabase JS client v2 (@supabase/supabase-js).
- For auth: @supabase/auth-helpers-nextjs.
- For realtime: Supabase Realtime subscriptions.

## Best Practices
- RLS: Enable Row Level Security; design policies for performance (avoid heavy joins).
- Queries: Use .select(), .insert(), .update(), .delete() methods; chain for composition.
- Immutability: Map results to frozen objects or use pure mappers.
- Security: Never expose Supabase anon key client-side for sensitive ops; use server-side.
- Error Handling: Catch SupabaseError; use monadic patterns (e.g., Result type).

## FP Tips
- Treat queries as pure functions: Input params -> output data.
- Caching: Use Next.js caching with revalidateTag for ISR.
- Triggers: Use Supabase database triggers for business logic.

## Example (Next.js Server Component)
```tsx
import { createClient } from '@/lib/supabase';

async function fetchUsers() {
  const supabase = createClient();
  const { data, error } = await supabase.from('users').select('*');
  if (error) throw new Error(error.message);
  return data;
}
```

Additional:
- Admin Mode: Use service role key server-side for admin tasks.
- Mutations: Use Server Actions with Supabase client.
- Realtime: Subscribe in client components with useEffect.

Modify with squad-specific Supabase configs (e.g., PostgreSQL schemas, RLS policies).
