vim.cmd [[

" nvimR_config.vim
"
"-----------------------------
" Ref for init.vim for nvim-r
" https://gist.githubusercontent.com/tgirke/7a7c197b443243937f68c422e5471899/raw/init.vim
"
" 
map <F2> <Plug>RStart
map <Leader><F2> <Plug>RStop
nmap <Leader>d <Plug>RDSendLine

"	turn on:  insert console outputka
nnoremap <Leader>o <Plug>Rinsert
"nnoremap <Leader>o \o<CR>

" Send selection or line to R with space bar, respectively.
vmap <Space> <Plug>RDSendSelection


"
" 15 May 2021:   with next line  <C-spacebar> activaes omni-completion
let R_auto_omni=["r","rmd","rhelp"]



" 4 JUL 2021:
"
" R_assign
" =============================================================
" :echo R_assign     " 2, to see value (no quotes)
" :let R_assign=n     to change value (effectively immediate)
"
" Shortcut for R assignment operator: 0 turns it off; 
" 1 requires one _ to produce <- 
" 2 requires two __ to produce <- 
let R_assign = 2 
" =============================================================

" Ensures usage of your own ~/.tmux.conf file
" let R_notmuxconf = 1


" working dir
  " let R_nvim_wd = 1;  R wd same as vim directory (when R starts)
  " let R_nvim-wd = -1  no change to wd (when R starts)
  " :h R_nvim_wd
  "
let R_nvim_wd = 1



" R startup args (do not use .RData)
let R_args = [ '--no-save', '--no-restore-data'  ]

" fails
" open pdf when pdflatex run?
" 0 never
" 1 only first
" 2 always
let R_openpdf = 2


" ,kr  to open html file in browser
" works !
" 1 = always
let R_openhtml = 1


let rmd_syn_hl_chunk=1      " highlight chunk as R code

"	August 2022 
"	GOAL: TURN OFF `syntax` folding, want regular manual vim folding 
let r_syntax_folding=0

" open unfolded
set nofoldenable

"	When R console in emacs mode; this sends <C-a> (beg) and <C-k> (delete all chars to right)
"	BEFOPE the R code is send to terminal.  So cleans any stray stuff sitting on console line.
let R_clear_line = 1


" let R_editing_mode = "vi"
    " (Default) R console editor is emacs(?)
    " To set to vi, either use ~/.inputrc, which BASH, not ZSH uses
    " OR, set here


"let R_in_buffer = 0
"let R_tmux_split = 1
"let R_applescript = 0
"let R_tmux_close = 0


"--------
" FUTURE
"--------
"
" let R_nvimpager = "vertical" (defaultz0
"
" let R_help_w = 
"
" let R_editor_w = 
" let R_editor_h =
"
" let R_rconsole_width = 
" let R_rconsole_height
" ==================================================
" EXPERIMENTAL
" Wed 04Jan2023

function! s:customNvimRMappings()
   nmap <buffer> <Leader>sr <Plug>RStart
   imap <buffer> <Leader>sr <Plug>RStart
   vmap <buffer> <Leader>sr <Plug>RStart

" match vim's
  nmap <buffer> <Leader>wd <Plug>RSetwd
endfunction
augroup myNvimR
   au!
   autocmd filetype r call s:customNvimRMappings()
augroup end
]]
