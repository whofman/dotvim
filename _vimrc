set nocompatible              " be iMproved, required
filetype off                  " required

"execute pathogen#infect('bundle/{}', '%userprofile%/vimfiles/bundle/{}')
call pathogen#runtime_append_all_bundles('bundle/{}', '%userprofile%/vimfiles/bundle/{}')
call pathogen#helptags()
filetype plugin indent on     " required

set nocompatible              " not compatible with vi
set autoread                  " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set a map leader for more key combos
let mapleader = ','

" Tab control
set noexpandtab                " tabs ftw
set smarttab                   " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2                  " the visible width of tabs
set softtabstop=2              " edit as if the tabs are 4 characters wide
set shiftwidth=4               " number of spaces to use for indent and unindent
set shiftround                 " round indent to a multiple of 'shiftwidth'

set clipboard=unnamed          " allow OS clipboard access
set ttyfast                    " faster redrawing
set mouse=a
set ttymouse=xterm2

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" code folding settings
set foldmethod=syntax          " fold based on indent
set foldnestmax=10             " deepest fold is 10 levels
set nofoldenable               " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set ignorecase                 " case insensitive searching
set smartcase                  " case-sensitive if expresson contains a capital letter
set hlsearch                   " highlight search results
set incsearch                  " set incremental search, like modern browsers
set nolazyredraw               " don't redraw while executing macros

set magic                      " Set magic on, for regex

set showmatch                  " show matching braces
set mat=2                      " how many tenths of a second to blink
set wildmenu                   " handle command line completion 
set wildmode=longest:full,full

" syntax on                      " switch syntax highlighting on

set encoding=utf8
let base16colorspace=256       " Access colors present in 256 colorspace"
set t_Co=256                   " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme solarized

" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("%c")}'

set number

set autoindent                 " automatically set indent of new line
set smartindent

set laststatus=2               " show the satus line all the time

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>u :exe "set " . (&rnu == 1 ? "nornu" : "rnu")<cr>

" Mappings to open config files
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>et :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>eg :tabnew ~/.gitconfig<cr>
nnoremap <leader>em :tabnew ~/Downloads/tmux.md<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:NERDTreeQuitOnOpen=0                   " close NERDTree after a file is opened
let NERDTreeShowHidden=1                     " show hidden files in NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>  " Toggle NERDTree
nmap <silent> <leader>y :NERDTreeFind<cr>    " expand to path of file in current buffer

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>

nmap <F8> :TagbarToggle<cr>
nnoremap <F5> :GundoToggle<cr>

let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_working_path_mode = 2            " search nearest ancestor for .git, .hg, .svn

" ignore+=*/tmp/*,*.so,*.swp
