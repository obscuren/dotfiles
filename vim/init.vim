" Set the shell something meaningfull
set shell=/bin/zsh
" Enable plugins
filetype plugin indent on
" Load plugins before config
execute pathogen#infect()

"########################## Plugin settings ############################
let g:go_bin_path = "/home/jeffrey/go"
let g:go_fmt_command = "goimports" 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:python_host_prog = "/usr/local/bin/python"
let g:airline_powerline_fonts = 1
" When opening a file with Ack, open in the middle of the screen
"let g:ack_mappings = { "o": "<CR>zz" }
let g:ackhighlight = 1
let g:ackpreview = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

function ToggleLineno()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction


"========================== Main settings ================================

set nocompatible                " Use vim, no vi defaults
set backspace=indent,eol,start  " backspace through everything
set enc=utf-8
set fileencoding=utf-8
syn on                          " Turn on syntax highlighting
set hidden                      " Hide buffers
set autoread                    " Autoread file if changed outside VIM (Only when the file hasn't changed locally)
set grepprg=ack               " Set Ack instead of grep
set wildchar=<Tab> wildmenu wildmode=full " Enable the wild menu on tab in ex mode

set hlsearch                    " highlight searches
set incsearch                   " incremental searches
set ignorecase                  " case insensitive
set smartcase                   " .... unless they contain at least one capital letter
set scrolloff=5

set completeopt=menu,preview


"==================== Colors ======================================

set background=dark             " Set light barkground
set t_Co=256                    " Set vim to 256 colors
let g:solarized_termcolors=256  " Set solarized console to 256 colors
let g:solarized_hitrail=1
colorscheme PaperColor


"==================== Status line =================================

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l/%L,%c%V%)\ %P
set laststatus=2                " Set last status


"===================== Cursor =====================================

" set cursorcolumn                " Column marker
set cursorline                  " Set cursor


"===================== Indentation ================================

set autoindent                  " Autoindent new lines
set expandtab                   " Use spaces instead of tabs
set tabstop=8                   " Set tabs to 2 whitespaces
set shiftwidth=8                " 8
set mouse=a                     " Enable mouse support
set title                       " Set the title of the current file as xterm title
set shiftround                  " When at 3 spaces indent to 4 instead of 5
set textwidth=0 wrapmargin=0

" Special rules for Go
augroup GoGroup
    autocmd BufNewFile,BufRead *.go set tabstop=8
    autocmd BufNewFile,BufRead *.go set noexpandtab
    autocmd BufNewFile,BufRead *.go set shiftwidth=8
    "autocmd FileType go autocmd BufWritePre <buffer> silent Fmt
augroup END


"==================== History =====================================

set history=100                 " Set history to 1000
set undofile
set dir=~/.vimswap//,/var/tmp//,/tmp//,. " Store swap files in fixed location, not current directory.


"==================== Search ======================================

set incsearch                   " Find as you type
set ignorecase                  " Case insensitive search
set smartcase                   " Match case only when a capital is used
set hlsearch                    " Highlight searches


"==================== Misc ========================================

set splitright                  " VSplit on the right instead of the left side


"==================== Disables ====================================

" Disable Ex mode
map Q <Nop>
" Disable `man WORD`
map K <Nop>


"
" Key mapping
"
" My key mappings are organised using mnemonic prefixes. Mappings for
" buffers using "b", windows "w", etc.
"
" My leader, which is used for all commands is mapped to "space", just like
" Spacemacs; SPC.
let mapleader=" "

"=========== Windows ===================

nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>w\ :vsp<CR>
nnoremap <Leader>w- :sp<CR>
nnoremap <Leader>wc :q<CR>

nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt


"=========== vimrc editing =============

nnoremap <silent> <Leader>fed :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>feR :source ~/.config/nvim/init.vim<CR>


"=========== Go dev ====================

nnoremap <silent> <Leader>mgg :GoDef<CR>
nmap <silent> <leader>mtt <Plug>(go-test)
nmap <silent> <leader>mr <Plug>(go-run)
nmap <leader>mce <Plug>(go-callees)
nmap <leader>mcc <Plug>(go-callers)
nmap <leader>mb <Plug>(go-build)
nmap <Leader>md <Plug>(go-doc)


"=========== Buffers ===================

nnoremap <Leader><Tab> <C-^>
nnoremap <silent> <Leader>bd :bdel<CR>


"=========== Project ===================

nnoremap <silent> <Leader>pf :CtrlP<CR>
nnoremap <silent> <Leader>pt :TagbarToggle<CR>


"=========== File ======================

nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>


"==================== Buffers =====================================

set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <silent> <Leader>bh :bprev<CR>
nnoremap <silent> <Leader>bl :bnext<CR>


"=========== Toggles =====================

nnoremap <leader>tn :call ToggleLineno()<CR>


"==================== Tools ======================================

map <F9> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>


"==================== Misc =======================================

" Redo command but leave cursor on current position
nmap . .`[
" Escape with jj
inoremap jj <ESC>
" Remove trailing spaces
nnoremap <leader>W %s/\s\+$//<cr>:let @/=''<cr>
" Pasting toggle
set pastetoggle=<F2>

" This command based on VimTip483 uses <cword> to get the word under the cursor, but also uses % to limit the search to the current file only
command! GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
command! Dark :set background=dark
command! Light :set background=light

" Json prettyfier
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

augroup Fugitive
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd User fugitive
                \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
                \   nnoremap <buffer> .. :edit %:h<CR> |
                \ endif
augroup END

" Autosafe on focus lost, ignore warnings for new files
"au FocusLost * silent! wall
let g:github_user = "obscuren"
let g:github_token = "c44b908c49e745fe9022d43461f21fd1ccf61af4"
let g:gist_clip_command = "pbcopy"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
