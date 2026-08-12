---
name: project-memory
description: Project memory that records every decision and path a project takes in a per-project project.md file. Use this skill whenever the user mentions project memory, project history, "project.md", "what have we decided", "remind me what we did", or at the start of a new session to load a project's history. Also use it whenever a significant decision is made or a new path is chosen during any session so the decision gets recorded.
---

# Project Memory

Each project keeps a living `project.md` file in the project's root directory (the current working directory). This file is the project's memory: it records every decision and every path the project takes, so that any future session — for you or a human — can pick up exactly where things left off without re-deriving context.

## When to record

Record a decision whenever a significant choice is made or a path is chosen:

- A direction is selected (architecture, library, approach, layout, naming scheme)
- A feature is planned, started, or completed
- A design or API is settled
- A tool, dependency, or convention is adopted
- The user states a preference or requirement
- The project enters a new phase or milestone

Record decisions as they happen during the session — don't wait for the session to end. Also do a quick final pass at the end of the session to make sure nothing significant was missed.

**Do NOT record paths that failed.** The file is a record of where the project is going, not where it has been. If something was tried and abandoned, that is not memory worth keeping — leaving it out keeps the file lean and the history trustworthy. (If a failed path is later relevant, the decision that replaced it will carry the context.)

## Loading memory

At the start of a session, if a `project.md` exists in the working directory, read it first. It tells you the project's history, current state, and decisions — use it as the authoritative context for the work ahead. If it doesn't exist and the session is clearly project work, create it with the first decision that gets made.

## How to record

Decisions should be captured as they happen, in one of two ways:

- **Inline updates**: Append to or edit the file immediately when a decision is made.
- **End-of-session pass**: Review the session and fill in anything significant that wasn't captured inline.

Each entry should be a concise bullet or short section capturing:

- **What was decided** (the choice, not the deliberation)
- **Why** (one line — enough to make the decision intelligible later)
- **When** (date or session context, optional but useful)

## File format

Keep it simple and scannable. Use this structure:

```markdown
# <Project Name>

## Decisions
<!-- Append newest at the bottom -->
- YYYY-MM-DD: Decided to <choice>. Why: <reason>

## Current state
<!-- One short paragraph: where the project is right now -->

## Paths chosen
- <Path or direction being pursued>
```

Don't let the file bloat. If it grows long, trim old entries down to their essence — a decision that was superseded can be replaced by the decision that superseded it.

## Guiding principles

- **Continuity is the point.** A future session reads this file instead of asking. Make it complete enough that no history is lost, but lean enough that reading it is fast.
- **Record the chosen path, not the journey.** Failed paths are noise; the decisions that matter are the ones the project is living with.
- **Record as you go.** A decision captured while fresh is accurate; one reconstructed from memory later is not.
