# PURPOSE:  clean up git files, projects; begin fresh  


## git_project.md
- This is the project file (memmory)
- Follow  the AGENTS.md file

## Github use
- I am solo, not work with team
- Use github as backup.


## Task #1 Find all .git projects on local hard drive
- write a checklist of such projects and print them below


## Task #2 Where possible:
- STOP here.  Ask user if OK to proceed.
- delete the .git/ locally   (Do not delete coding or other files)
- remove the "backups" from github
- create a checklist of problem/issues to review for user


## When there are no more .git projects locally, 
- locally, create new .git projects
- push to github


## Saftely
- Before deleting, always think and check not deleting any important files; only file related to .git/



## DO NEXT

## TODO



## GOAL

ignore mp3_downloads/

## Checklist (Task #1) — .git locations found
[ ] - /home/jim/bin
[ ] - /home/jim/code/docs
[ ] - /home/jim/code/emacs_practice_project
[ ] - /home/jim/code/github_actions_project
[ ] - /home/jim/code/git_project
[ ] - /home/jim/code/health_labs
[ ] - /home/jim/code/jimTools
[ ] - /home/jim/code/LLM_project
[ ] - /home/jim/code/make_project
[ ] - /home/jim/code/mcp_project
[ ] - /home/jim/code/publish_project
[ ] - /home/jim/code/python_project
[ ] - /home/jim/code/pytorch_projects/gym_game  (NOT a github repo yet — do not touch until Task #2)
[ ] - /home/jim/code/shiny_project
[ ] - /home/jim/code/stats_project
[ ] - /home/jim/code/try_things_here
[ ] - /home/jim/code/zsh_project
[ ] - /home/jim/dotfiles
[ ] - /home/jim/.config/emacs (+ ~100 straight repos) (emacs.original ignored per user)
(note: mp3_downloads .git removed; throwaway removed entirely)

## Problems / questions / issues
[ ] - gym_game (pytorch) is NOT a github repo yet — do not touch until Task #2 (6 untracked files present).
[ ] - dotfiles tracks opencode config — do not delete without backup (currently clean).
[ ] - git_project has two remotes (git_project, origin) — which is canonical?
[ ] - Removing github backups needs repo list + gh auth (gh installed v2.74.1).
[ ] - emacs straight repos are third-party clones — deleting breaks package manager; keep.
[ ] - Need user decision on scope and order before any deletion.
[ ] - Re-init + push requires creating remotes for repos with none.
[ ] - throwaway removed entirely; mp3_downloads .git removed; bin/python_project clean.
