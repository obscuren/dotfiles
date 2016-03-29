" Set the shell something meaningfull
set shell=/bin/zsh
" Enable plugins
filetype plugin indent on
" Load plugins before config
execute pathogen#infect()

"########################## Plugin settings ############################
let g:go_bin_path = "/home/jeffrey/go"
let g:python_host_prog = "/usr/local/bin/python"
let g:go_fmt_command = "goimports" 
let g:airline_powerline_fonts = 1
" When opening a file with Ack, open in the middle of the screen
"let g:ack_mappings = { "o": "<CR>zz" }
let g:ackhighlight = 1
let g:ackpreview = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"########################## Main config ################################
    set nocompatible                " Use vim, no vi defaults
    set backspace=indent,eol,start  " backspace through everything
    set enc=utf-8
    set fileencoding=utf-8
    syn on                          " Turn on syntax highlighting
    set hidden                      " Hide buffers
    set autoread                    " Autoread file if changed outside VIM (Only when the file hasn't changed locally)
    set grepprg=ack               " Set Ack instead of grep
    set wildchar=<Tab> wildmenu wildmode=full " Enable the wild menu on tab in ex mode
    let mapleader=","
    set number                      " show line numbers
    set hlsearch                    " highlight searches
    set incsearch                   " incremental searches
    set ignorecase                  " case insensitive
    set smartcase                   " .... unless they contain at least one capital letter

    set completeopt=menu,preview

    "==================== Colors ======================================

    set background=dark             " Set light barkground
    set t_Co=256                    " Set vim to 256 colors
    let g:solarized_termcolors=256  " Set solarized console to 256 colors
    let g:solarized_hitrail=1
    colorscheme solarized
    " colorscheme  smyck          " Color schema
    " colorscheme molokai
    "set list!                       " Unset list

    "==================== Status line =================================

    " set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
    set laststatus=2                " Set last status

    "===================== Spelling ===================================

    "set spell                       " Enable spell checking
    "set spelllang=en                " Set spelling to English

    "===================== Cursor =====================================

    " set cursorcolumn                " Column marker
    "set cursorline                  " Set cursor

    "===================== Indentation ================================

    set autoindent                  " Autoindent new lines
    set expandtab                   " Use spaces instead of tabs
    set tabstop=4                   " Set tabs to 2 whitespaces
    set shiftwidth=4                " 2
    "set softtabstop=2               " 2 space tabs
    set mouse=a                     " Enable mouse support
    set title                       " Set the title of the current file as xterm title
    set shiftround                  " When at 3 spaces indent to 4 instead of 5
    set textwidth=0 wrapmargin=0

    " Special rules for Go
    autocmd BufNewFile,BufRead *.go set tabstop=8
    autocmd BufNewFile,BufRead *.go set noexpandtab
    autocmd BufNewFile,BufRead *.go set shiftwidth=8
    "autocmd FileType go autocmd BufWritePre <buffer> silent Fmt

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
"########################## KEY BINDINGS ###################################

    "==================== Disables ====================================

    " Disable Ex mode
    map Q <Nop>
    " Disable `man WORD`
    map K <Nop>

    "==================== Plugins =====================================

    " Toggle NerdTree
    map <silent> <Leader>. :silent NERDTreeToggle<CR>
    " Toggle BufferWindow
    map <Leader>b :BuffergatorToggle<CR>

    "==================== Windows =====================================

    " Switch to window left
    map <C-h> <C-w>h
    " Switch to window right
    map <C-j> <C-w>j
    " Switch to window above
    map <C-k> <C-w>k
    " Switch to window below
    map <C-l> <C-w>l
    " Split window vertical
    map <C-\> :vsp<CR>
    " Split window horizontal
    map <C-_> :sp<CR>

    " Edit <file> in current working dir as current file
    map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
    " ^ split
    map <Leader>s :sp <C-R>=expand("%:p:h") . '/'<CR>
    " ^ vertical split
    map <Leader>vs :vsp <C-R>=expand("%:p:h") . '/'<CR>

    "==================== Buffers =====================================

    " Switch to previous buffer
    noremap <Leader><Leader> <C-^>
    " Yank to OS Clipboard
    noremap <Leader>y "*y
    " Yank line to OS Clipboard
    noremap <Leader>Y "*Y
    " 
    noremap <C-d> :TagbarToggle<CR>


    " Open spec file for the current JavaScript file
    function! OpenSpecFile()
      let file = matchlist(expand("%:p"), 'app/assets/javascripts\([A-Za-z_/]\+\).js')

      execute "vsp spec/javascripts/" . file[1] . 'Spec.js'
    endfunction
    noremap <Leader>- :call OpenSpecFile()<CR>

    "==================== Tools ======================================
    " This mapping uses <cword> to get the word under the cursor, and searches for it in the current directory and all subdirectorie.
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

    " ================== GUI ONLY =====================================

    if has("gui_running")
      map <D-u> :Gist<CR>
      map <D-C> :ColorHEX<CR>
      " color moloai
    endif

"########################### COMMANDS "####################################

    " This command based on VimTip483 uses <cword> to get the word under the cursor, but also uses % to limit the search to the current file only
    command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
    command Dark :set background=dark
    command Light :set background=light

    " Json prettyfier
    command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
    "command W :w

    " Finally, this cabbrev uses CTRL-R CTRL-W to get the word under the cursor, limiting the search to files of the same type using expand("%:e")
    cabbrev lvim
          \ lvim /\<lt><C-R><C-W>\>/gj
          \ **/*<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
          \ <Bar> lw
          \ <C-Left><C-Left><C-Left>

    " Scientific calculator
    "command! -nargs=+ Calc :py print <args>
    "py from cmath import *
"} </Commands>

if has("autocmd")
  autocmd BufNewFile,BufRead Rakefile,Capfile,Gemfile,Guardfile,config.ru,*.rd,*.god setfiletype ruby
  autocmd BufNewFile,BufRead *.styl setfiletype sass
  autocmd BufNewFile,BufRead *.jade setfiletype haml
  autocmd BufNewFile,BufRead *.mu setfiletype go
  au BufNewFile,BufRead *.ejs set filetype=html

  " Automatically delete fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd BufNewFile,BufRead *.hamljs setfiletype haml

  autocmd InsertEnter * set number
  autocmd InsertLeave * set relativenumber

  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

endif


if has("gui_running")
  " Get rid of annoying balloon error popups about ri -f simple. I don't care
  " about hovers anyway
  autocmd FileType ruby,eruby set noballooneval
  set guioptions=egmt
  set guifont="Source Code Pro for Powerline"
else
  "set cursorline!
  "set cursorcolumn!
endif


" Autosafe on focus lost, ignore warnings for new files
"au FocusLost * silent! wall
let g:github_user = "obscuren"
let g:github_token = "c44b908c49e745fe9022d43461f21fd1ccf61af4"
let g:gist_clip_command = "pbcopy"
