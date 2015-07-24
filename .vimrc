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


" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Map sort function to a key
vnoremap <Leader>s :sort<CR>


" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gq)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
autocmd FileType python  setlocal colorcolumn=79,99,119  " column start from 0
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
au Filetype htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Color
set background=dark


" Vundle
" Vim plugin manager
"
" Install:
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Usage:
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" see :h vundle for more details or wiki for FAQ
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'


" Powerline
" Better-looking, more functional vim statusline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2


" ctrlp.vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"
" Usage:
"  Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
"  Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
"  Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc  " Ignore python byte codes


" Python-mode
" A collection of python utilities for Vim
Plugin 'klen/python-mode'
let g:pymode_rope=0                " Disable rope support
let g:pymode_doc=0                 " Disable python documentation
let g:pymode_lint=0                " Disable code checking


" syntastic
" Syntax checking hacks for vim
"
" Setup:
" Require flake8 in virtualenv
" $ pip install flake8
"
" Usage:
" :Errors    Display the errors for the current buffer
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" jedi-vim
" Python autocompletion
"
" Usage:
" Completion <C-Space>
" <leader>g    Goto assignments (typical goto function)
" <leader>d    Goto definitions (follow identifier as far as possible, includes imports and statements)
" K            Show Documentation/Pydoc (shows a popup with assignments)
" <leader>r    Renaming
" <leader>j    Usages (shows all the usages of a name)
" :Pyimport    Open module, e.g. :Pyimport os (opens the os module)
" <leader>b    Set, unset breakpoint
Plugin 'davidhalter/jedi-vim'
let g:jedi#usages_command = "<leader>j"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<C-n>"


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" Fold python code nicely and toggle with one keystroke
"
" Usage:
" <leader>z    fold / unfold current function / class
" <leader>Z    fold / unfold all functions and classes in the file
Plugin 'yhlam/Efficient-python-folding'
set nofoldenable


" pytest.vim
" Runs your UnitTests with py.test displaying red/green bars and errors
"
" Usage:
" <leader>f    test file
" <leader>c    test class
" <leader>m    test method
" <leader>p    test project
" <leader>w    clear test loop
Plugin 'yhlam/pytest.vim'
nmap <silent><Leader>f <Esc>:Pytest file loop<CR>
nmap <silent><Leader>c <Esc>:Pytest class loop<CR>
nmap <silent><Leader>m <Esc>:Pytest method loop<CR>
nmap <silent><Leader>p <Esc>:Pytest project loop<CR>
nmap <silent><Leader>w <Esc>:Pytest clear<CR>


" vim-isort
" Vim plugin to sort python imports using isort
"
" Usage
" :Isort    Reorder imports of the current python file
" Ctrl-i    Sort the import of the selected block
Plugin 'fisadev/vim-isort'


" django.vim
" Syntax highlighting for Django templates
"
" Usage
" :setfiletype htmldjango    syntax highlighting for Django HTML templates
" :setfiletype django        syntax highlighting for Django templates but not
"                            HTML higlighting
Plugin 'vim-scripts/django.vim'


" vim-pydocstring
" Generate Python docstring to your Python script file
"
" Usage
" :Pydocstring    generate doc string when the cursor is on
"                 def or class keyword line
" <Leader>k       generate doc string when the cursor is on
"                 def or class keyword line
Plugin 'heavenshell/vim-pydocstring'
nmap <silent><Leader>k <Plug>(pydocstring)


" commentary.vim
" Comment stuff out
" Comment / uncomment lines by pressing ``\\\``
Plugin 'tpope/vim-commentary'
au FileType python set commentstring=#%s


" surround.vim
" Provides mappings to easily delete, change and add surroundings in pairs
"
" Usage:
" cs"'     change the " into '
" ds"      delete the "
" ysiw(    insert () surround a word
Plugin 'tpope/vim-surround'


" sensible.vim
" Extra settings for vim
Plugin 'tpope/vim-sensible'


" Extra text objects
" ea    Select the entire content of the current buffer
" ia    Like ia, but leading and trailing empty lines are excluded
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'


" MiniBufExpl
" Batter way to view the buffers
Plugin 'fholgado/minibufexpl.vim'


" Riv
" reStructuredText in Vim
Plugin 'Rykka/riv.vim'


" Vim trailing whitespace
" Highlight all trailing whitespace in red
"
" Usage:
" :FixWhitespace    Remove all trailing whitespaces
Plugin 'bronson/vim-trailing-whitespace'


" Conque
" Run terminal inside Vim buffer
"
" Usage:
" :ConqueTerm bash
" :ConqueTermSplit mysql -h localhost -u joe -p sock_collection
" :ConqueTerm python
Plugin 'basepi/vim-conque'


" CamelCaseMotion.vim
" Motion for CamelCase and snake_case
"
" Usage:
" W    camel case word
" B    camel case back
" E    camel case end
Plugin 'bkad/CamelCaseMotion'
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e


" MatchTag
" Highlights the matching HTML tag when the cursor is positioned on a tag
Plugin 'yhlam/MatchTag'


" fugitive
" Git wrapper
Plugin 'tpope/vim-fugitive'
set statusline=%{fugitive#statusline()}


" NerdTree
" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'
map <leader>p :NERDTreeToggle<CR>


" argtextobj.vim
" Text-object like motion for arguments
Plugin 'vim-scripts/argtextobj.vim'


" Emmet-Vim
" Expand abbreviations similar to emmet
Plugin 'mattn/emmet-vim'


" UltiSnips
" The ultimate snippet solution for Vim
"
" Usage:
" Tab         Expand snippet
" Ctrl+Tab    List snippets
" Ctrl+j      Jump forward
" Ctrl+k      Jump backward
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


" vim-jsx
" React JSX syntax highlighting and indenting for vim.
Plugin 'mxw/vim-jsx'


" Required by vundle
call vundle#end()
filetype plugin indent on
