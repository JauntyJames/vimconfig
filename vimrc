syntax enable
" show status bar
set laststatus=2
set showcmd        " display incomplete commands
set autowrite      " automatically :write before running commands
set showcmd

"for indents that consist of 4 space characters
" but are entered with the tab key
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle load plugins
Plugin 'Vundlevim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'surround.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Yggdroot/indentLine'
Plugin 'skielbasa/vim-material-monokai'
Plugin 'Townk/vim-autoclose'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

set background=dark
set termguicolors
set guioptions=          " removes scrollbars
colorscheme material-monokai
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
set macligatures " this shit: => !== <->
set guifont=Fira\ Code:h12
let g:airline_powerline_fonts = 1 " makes status bar look better
set list listchars=tab:»·,trail:·,nbsp:·   " Display extra whtiespace
set nojoinspaces  " use one space, not two, after punctuation
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
" enables hybrid numbers by default, relative in insert mode, and toggles
" when out of focus

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
autocmd InsertLeave * :set relativenumber
set incsearch
set hlsearch

let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.DS_Store$']

let mapleader = ","
nmap <leader>ne :NERDTree<cr>
" FINDING FILES:
" search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete

" Now We Can:
" - hit tab to :find by partial match
" - user * to make it fuzzy

" Things To Consider:
" - :b lets you autocomplete any open buffer

" Tag Jumping:

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .
set tags=./tags,tags;$HOME

" Now We Can:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" Things To Consider:
" - This doesn't help if you want a visual list of tags

" Autocomplete:

" the good stuff is documented in |ins-completion| 

" Highlights:
" - ^x^n for JUST this file
" - ^x^f for filenames (works withour path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'completion tag

" Now We Can:

" -use ^n and ^p to go back and forth in the suggestion list

" File Browsing:

" - :edit a folder to open a file browser
" - <CR>/v/t to open a h-split/v-split/tab
" - check |netrw-brows-map| for more mappings

" Snippets:
" Read an empty HTML template and move cursor to tile
nnoremap ,html :-1read $HOME/.vim/snippets/.skeleton.html<CR>6jwf>
nnoremap ,fetch :-1read $HOME/.vim/snippets/.fetch.js<CR>wla

" Now we can:
" - Take over the world!
" (with fewer keystrokes)

:imap jj <Esc>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-i> i_<Esc>r
" remaps ^i to insert one character

set viminfo='1000,f1,<500

let g:mta_filetypes = { 'html':1, 'xhtml':1, 'xml':1, 'php':1, 'ejs':1, 'javascript.jsx':1 }

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
