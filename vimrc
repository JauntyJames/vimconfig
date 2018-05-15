syntax enable
" show status bar
set laststatus=2
set showcmd        " display incomplete commands
set autowrite      " automatically :write before running commands
set showcmd

" encoding for vim-devicons
set encoding=UTF-8

"for indents that consist of 4 space characters
" but are entered with the tab key
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle load plugins
Plugin 'Vundlevim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'machakann/vim-highlightedyank'
Plugin 'morhetz/gruvbox'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'sheerun/vim-polyglot'
Plugin 'surround.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/MatchTagAlways'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'w0rp/ale'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on

set background=dark
set termguicolors
" removes scrollbars from gui
set guioptions=
colorscheme gruvbox
set macligatures " this shit: => !== <->
set guifont=FuraCode\ nerd\ font:h14

" fix rendering of filetype icons
" set ambiwidth=double
"
autocmd FileType nerdtree setlocal nolist

" let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" airline tab bar
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1 " makes status bar look better

" display linter warnings in status bar
let g:airline#extenstions#ale#enabled = 1
" configure airline seperators
let g:airline_left_sep=""
let g:airline_left_alt_sep = ''
let g:airline_right_sep=""
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep=""
let g:airline#extensions#tabline#right_sep=""
set list listchars=tab:»·,trail:·,nbsp:·   " Display extra whtiespace
set nojoinspaces  " use one space, not two, after punctuation
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>
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
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.DS_Store$']

nnoremap <SPACE> <Nop>
let mapleader = " "
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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" closes autocomplete prompt so that you can tab-expand snippets
let g:ycm_key_list_stop_completion = ['<C-y>']

" Now we can:
" - Take over the world!
" (with fewer keystrokes)

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>i i_<Esc>r
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

" Don't search in node_module folder
set wildignore+='*/node_modules/*'

" Linter settings
" let g:ale_javascript_eslint_use_global = 1

" use a split expolorer instead of project drawer
let NERDTreeHijackNetrw=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
  " change the default folder/directory glyph/icon
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
  " change the default open folder/directory glyph/icon (default is '')
" let g:DevIconsDefaultFolderOpenSymbolnSymbol = ''
" change the default dictionary mappings for exact file node matches

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Gemfile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Gemfile.lock'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.ruby-version'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Rakefile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.railsrc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore_global'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.github'] = ''
" add or override pattern matches for filetypes
" these take precedence over the file extensions

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*spec.*\.rb$'] = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change cursor shape in iterm
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" change cursor shape in tmux vim
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" mouse settings
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
  end

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

let g:highlightedyank_highlight_duration = 500
