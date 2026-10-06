---
name: explain_code
description: Use this skill whenever the user says "explain code", "review code with me", "walk me through code", or asks for a code walkthrough/review.
---

##  RULES
- The user is beginner, but you are expert.
- Display several lines of code (5-10) and number each line.  Then wait.   These 5-10 lines are called "chunks"
- The user may respond in one of several ways:
- - n means "next", continue on to next chunk of code (next 5-10 lines).  Continue the number pattern.
- - e means user needs explanation.
- - e 10, means user does not understand line 10
- - e 10-14, means user does not understand lines 10-14, inclusive
- - e      , by itself, means you must explain entire chunk to user
- - r      stay on same chunk, print again the lines and numbers
- - p      reprint current chunk with line numbers (same as r)
- - p10    print line 10 with line number
- - p10-14 print lines 10-14 inclusive, with line numbers
- If user forgets possible choices:  remind him to "n", "e","r","p"
- Do not include more than what the user asks for.
- If user asks for "link" or "reference", find 1 or 2 urls that explain in more detail.  (Be sure the information is current, not out-of-date)

