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

# Instructions for Breaking Down User Stories into Tasks with AI

These guidelines help engineers leverage AI tools (Gemini Chat or Copilot Chat) to decompose a user story into actionable tasks, incorporating project context for accuracy. This promotes iterative, focused workflows in Scrum, avoiding overload on AI or the engineer. Follow these steps when starting a new story.

## Step 1: Initialize the Story Folder
- Create a subfolder in `/stories/` named after the story ID (e.g., `mkdir stories/STORY-001`).
- Copy the template: `cp stories/overview-template.md stories/STORY-001/overview.md`.
- Edit `overview.md` to fill in the user story, acceptance criteria, business objectives, and relevant project context references (e.g., link to schema/architecture in `/project-canary-context/`).
- Commit this file for team visibility.

## Step 2: Prompt AI for Initial Breakdown
- Use Gemini Chat or Copilot Chat to generate a task list.
- Reference the story's `overview.md` and centralized context files to provide focused input.
- Example Prompt (adapt as needed):
  ```
  Using the story details in stories/[id]/overview.md, break it down into 4-6 tasks categorized by project-canary-context/task-archetypes.md (e.g., schema, API, frontend). Ensure alignment with project-canary-context/logical-architecture.md and project-canary-context/logical-schema.md. Output as a numbered list with 1-2 sentence descriptions per task. Do not generate code or estimates.
  ```
- Why this prompt? It keeps AI on planning (not implementation), enforces archetypes for structure, and pulls in context to avoid generic outputs.

## Step 3: Capture and Refine the Task List
- Copy the AI-generated task list into a new file in the story folder, e.g., `stories/[id]/tasks.md`.
- Format it as Markdown for easy reading/review (e.g., numbered list with categories).
- Review manually: Validate against acceptance criteria, add dependencies, or adjust for overlooked details (e.g., if a task misses FP alignment from squad-canary-standards/coding-standards.md).
- Commit `tasks.md` and share in standup for squad feedback.

## Step 4: Iterate if Needed
- If the breakdown is unsatisfactory (e.g., misses architecture nuances or schema details), refine by:
  - Updating `/project-canary-context/` files (e.g., add clarifications to logical-schema.md if AI hallucinates data structures).
  - Adjusting the prompt (e.g., add "Incorporate realtime requirements from project-canary-context/overview.md" for specific stories).
  - Re-prompt AI with the updated context and capture the new output in `tasks.md` (append iterations for audit trail).
- Aim for 1-2 iterations max per story to maintain momentum.

## Tips for Success
- Keep prompts concise—paste excerpts from files if needed, but prefer references to avoid token limits.
- Use this in Copilot modes: In IDE, highlight `overview.md` for context-aware chats.
- Align with Scrum: Discuss breakdowns in planning/refinement; retro on AI effectiveness.
- Reference squad-canary-standards/ai-prompt-patterns.md for more prompt examples.

This process ensures tasks are contextual, categorized, and ready for sequential implementation (e.g., tackle one task next with targeted AI help). Update these instructions based on pilot feedback.

# Examples
1. Code Suggestion: "Suggest a Clojure function for fetching users from DB, adhering to squad-standards/infrastructure/database.md and clojure/standards.md. Output as code block."
2. Design Brainstorm: "Outline a functional architecture for a React component handling Kafka events, following frontend/design.md."
3. Debugging: "Analyze this error in TypeScript: [paste error]. Suggest fixes per squad-standards."
4. Test Generation: "Generate unit tests for this Clojure function: [paste code]. Use FP style."

Add more patterns here for reuse.
