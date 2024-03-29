--  windows.lua
--
vim.cmd (
[[
function! UnderlineHeading(level)
  if a:level == 1
    normal! yypVr=
  elseif a:level == 2
    normal! yypVr-
  else
    normal! I### 
  endif
endfunction

nnoremap <leader>u1 :call UnderlineHeading(1)<cr>
nnoremap <leader>u2 :call UnderlineHeading(2)<cr>
nnoremap <leader>u3 :call UnderlineHeading(3)<cr>

"---------------------------------------
" Nov 30, 2022, jr stops tabs;   USE buffers"
"	tabs, begins with 1

" tabnew  ~/code/docs/300_tech_notes.md
" tabnew	~/code/docs/001_tech_reading.md
" tabnew	~/code/docs/medical_notes.md
" tabfirst
"---------------------------------------

"	split and load $V
"vsplit $V
"	wincmd R

]]
)

