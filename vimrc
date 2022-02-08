" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamedplus


" Enable mouse
set mouse=a


" Rebind <Leader> key
let mapleader = ","


" Highlight for search
set hls
nnoremap <silent> <C-N> :silent nohlsearch<CR>

" Allow switching buffer without save
set hidden


" Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Map sort function to a key
vnoremap <Leader>s :sort<CR>


" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Showing line numbers and length
set number relativenumber " show line numbers
set tw=79 " width of document (used by gq)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
autocmd FileType python  setlocal colorcolumn=79,87  " column start from 0
highlight ColorColumn ctermbg=235


" Easier formatting of paragraphs
" Select multiple lines then press ``Q`` to wrap the lines
vmap Q gq
nmap Q gqap


" Set number of history and undo level
set history=1000
set undolevels=1000


" Space for indentation
" 4 spaces charactor for each indentation level
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
au Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au Filetype beancount setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Color
set background=dark
colorscheme lucius
hi Visual term=reverse cterm=reverse guibg=Grey


" Undo tree
" Save undo trees in files and set number of undo saved to 10,000
set undofile
set undodir=~/.vim/undo
set undolevels=10000


" Airline
" Lean & mean status/tabline for vim that's light as air
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>n <Plug>AirlineSelectPrevTab
nmap <leader>m <Plug>AirlineSelectNextTab


" fzf.vim
" A command-line fuzzy finder
map <c-p> :Files<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)


" CamelCaseMotion.vim
" Motion for CamelCase and snake_case
"
" Usage:
" W    camel case word
" B    camel case back
" E    camel case end
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" fugitive
" Git wrapper
set statusline=%{fugitive#statusline()}

" NerdTree
" A tree explorer plugin for vim.
map <leader>p :NERDTreeToggle<CR>

" SimpylFold
" No-BS Python code folding for Vim
let g:SimpylFold_docstring_preview = 1

" FastFold
" Speed up Vim by updating folds only when called-for
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']


" Syntastic
" Syntax checking hacks for vim
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8', 'mypy']


" Automatically removing all trailing whitespace for python
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e

" Set python comment with space after #
au FileType python set commentstring="# %s"


" jedi-vim
" Python autocompletion
let g:jedi#completions_command = "<C-N>"
let g:jedi#popup_select_first = 0
