---
tags:
  - tmux
---
### To attach to a specific session
```bash
tmux a -t 0
```
---
### The copy mode
- to enter the copy mode `CTRL+B` => `[`
	- to go to a specific line inside the copy mode `g` and the `{number}`
	- to exit the copy mode `q`
---
### Splitting
- to make a vertical split `CTRL+B` => `%`
- to make a split horizontally `CTRL+B` => `"`
- to switch between them `CTRL+B` =>`Arrow Keys`
- to resize the windows `CTRL+B` => `CTRL+{ArrowKeys}`
- to close this pane `CTRL+B` => `x`
---
### The command mode
- to enter the command mode `CTRL+B` => `:`
---
### Config file
- The destination is `~/.tmux.config`
- the content of it while I am writing this notes:
  ```bash
	  bind-key r command-prompt -p 'Rename window:' 'rename-window "%%"'
	```