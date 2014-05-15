" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

python << EOF
import vim
import re
ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'
def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1
    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)
    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)
vim.command('map <f6> :py set_breakpoint()<cr>')
EOF

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone https://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 12
set wildignore+=*.pyc
"" set wildignore+=*lib/*
set wildignore+=*bin/*
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone https://github.com/davidhalter/jedi-vim.git
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=0

" Flake8 customization
" cd ~/.vim/bundle
" git clone https://github.com/nvie/vim-flake8
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:pyflakes_use_quickfix=0
let g:flake8_max_line_length=80
" let g:flake8_ignore="E501"

" Markdown syntax highlighting
" cd ~/.vim/bundle
" git clone https://github.com/plasticboy/vim-markdown.git
let g:vim_markdown_folding_disabled=1

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

