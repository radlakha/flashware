# AI Prompt Patterns

Collection of effective prompt templates for Gemini Chat and Copilot modes. Add new ones as discovered.

## General Structure
Initial Setup for AI Collaboration: Began by organizing squad-wide standards in /squad-standards/ (or pilot variants like /squad-canary-standards/), including files for coding, design, infrastructure (e.g., Supabase, Kafka, GraphQL), and AI prompt patterns. This draws inspiration from tools like Claude Code or Cursor, creating modular files/folders (e.g., by language like Clojure or Next.js) to provide persistent context, reduce AI hallucinations, and enforce FP paradigms.

Integrating Standards into Workflow: Shifted focus to how engineers use these standards when starting a user story, emphasizing small steps to avoid overwhelming AI (e.g., not dumping full stories for code generation). Introduced /stories/[id]/ folders with an overview.md template for story-specific details, linking to broader context.

Centralizing Project Context: To avoid per-story duplication, created a centralized /project-context/ folder (or pilot like /project-canary-context/). This acts as a "one-stop shop" for AI prompts during breakdowns, containing overview, roadmap, logical schema, logical architecture, task archetypes. It's squad-standards adjacent but project-specific, enabling efficient referencing in prompts for story decomposition into categorized tasks (e.g., frontend, API).

AI-Assisted Breakdowns: Defined prompt patterns for breaking stories into 4-6 tasks using archetypes, aligning with project architecture/schema. This sets up iterative task handling, with future steps to refine per-task AI usage (e.g., design, code, test).
This process emphasizes modularity, reference-ability for AI tools (Gemini Chat, Copilot modes), and Scrum alignment (e.g., for reviews/retros). 

Update this summary as we iterate.

- Always reference standards: "Follow squad-standards/coding-standards.md and [language]/standards.md."
- Be specific: Include examples, constraints, and desired output format.

## Examples
1. Code Suggestion: "Suggest a Clojure function for fetching users from DB, adhering to squad-standards/infrastructure/database.md and clojure/standards.md. Output as code block."
2. Design Brainstorm: "Outline a functional architecture for a React component handling Kafka events, following frontend/design.md."
3. Debugging: "Analyze this error in TypeScript: [paste error]. Suggest fixes per squad-standards."
4. Test Generation: "Generate unit tests for this Clojure function: [paste code]. Use FP style."

Add more patterns here for reuse.
