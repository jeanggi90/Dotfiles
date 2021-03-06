"" Leader Shortcuts
" Change leader to comma
let mapleader=","
let maplocalleader=","

" Disable some mappings
noremap  <f1> <nop>
inoremap <f1> <nop>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Insert new line without enterint insert
nnoremap oo o<Esc>k
nnoremap OO O<Esc>j

" Window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Windows resize
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Move to errors
nnoremap <leader>e :lnext<CR>
nnoremap <leader>E :lprevious<CR>
"
" Correctl last spelling
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Open and close folds
nnoremap <leader>f zA

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

"" Remove Trailing Spaces by calling `TrimWhitespaces` or using a shortcut
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
:noremap <Leader>w :call TrimWhitespace()<CR>

"" Markdown
" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pp :RunSilent xdg-open /tmp/vim-pandoc-out.pdf<CR>
