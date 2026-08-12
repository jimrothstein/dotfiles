---
name: bump_version
description: Use this skill whenever the users says to "bump version" AND gives an *.md file.
---

## Bump Version



### User gives no *.md file
- Tell user "please provide a valid *.md file"
- Stop.  Do nothing more.

### Read *.md
- Read metadata yaml header.
- If no "version" in metadata, tell user, do not apply this skill  and continue with other tasks.
- If do find "version" in metadata, replaces its value with .001 plus the original value.
- Example:
```
version:  0.001
```
becomes:
```
version: 0.002
```
- Then save the file


- Another Example:
```
version:  0.302
```
becomes
```
version:  0.303
```
