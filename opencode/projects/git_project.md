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
[ ] - /home/jim/code/pytorch_projects/gym_game
[ ] - /home/jim/code/shiny_project
[ ] - /home/jim/code/stats_project
[ ] - /home/jim/code/try_things_here
[ ] - /home/jim/code/zsh_project
[ ] - /home/jim/dotfiles
[ ] - /home/jim/mp3_downloads
[ ] - /home/jim/.config/emacs (+ ~100 straight repos) (emacs.original ignored per user)

## Problems / questions / issues
[ ] - Uncommitted changes in 5 repos (python_project 8, gym_game 6, dotfiles 2, mp3_downloads 1, throwaway removed) — deleting .git loses them unless committed/stashed first.
[ ] - mp3_downloads, gym_game have no remote — no recovery after deletion (throwaway removed).
[ ] - dotfiles tracks opencode config — do not delete without backup.
[ ] - bin fixed: working tree clean (was 12 uncommitted).
[ ] - git_project has two remotes (git_project, origin) — which is canonical?
[ ] - Removing github backups needs repo list + gh auth (gh installed v2.74.1).
[ ] - emacs straight repos are third-party clones — deleting breaks package manager; keep.
[ ] - Need user decision on scope and order before any deletion.
[ ] - Re-init + push requires creating remotes for repos with none.
