set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colorize color values
Plugin 'chrisbra/Colorizer'

" Pandoc base and syntax
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Inkscape integration
Plugin 'silverbulletmdc/vim-inkscape-insert'

" i3 syntax
Plugin 'mboughaba/i3config.vim'

" Latex liveview
Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

syntax enable
filetype plugin indent on

set t_Co=256            " enable 256 colors

"" Tabs and Spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " number of spaced per shift
autocmd FileType yaml,yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"" UI Visuals
set number              " show line numbers
"set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

"" Leader Shortcuts
" Change leader to comma
let mapleader=","
nnoremap <leader>c :ColorToggle<CR>

"" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

"" Folding
set foldenable          " enable folding
set foldlevelstart=1    " fold everything at start
" open/closes folds
nnoremap <space> za
set foldmethod=syntax   " fold based on syntax
" Save folds on save and restore automatically when open file
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" Shell foldings
au FileType sh let g:sh_fold_enabled=5
au FileType sh let g:is_bash=1
au FileType sh set foldmethod=syntax
" Python foldings
au FileType python set foldmethod=indent
au FileType yaml set foldmethod=indent
" Markdown folding
let g:markdown_folding = 1

"" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
" Exit insert mode
inoremap jj <Esc>
" Insert new line without enterint insert
nmap oo o<Esc>k
nmap OO O<Esc>j

" highlight last inserted text
nnoremap gV `[v`]

"" Launch Config
execute pathogen#infect()

"" Backup
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

"" Markdown
" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pp :RunSilent xdg-open /tmp/vim-pandoc-out.pdf<CR>

"" Remove Trailing Spaces by calling `TrimWhitespaces` or using a shortcut
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
:noremap <Leader>w :call TrimWhitespace()<CR>

"" Spell correction
" Enable for some default programs
augroup enableSpell
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd BufRead /tmp/neomutt-* setlocal spell
augroup END
