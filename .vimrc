if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    autocmd!
    " In text files, always limit the width of text to 78 characters
    " autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
    " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
    autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
    " start with spec file template
    autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add $PWD/cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" setting
"•¶šƒR[ƒh‚ğUFT-8‚Éİ’è
set fenc=utf-8
" ƒoƒbƒNƒAƒbƒvƒtƒ@ƒCƒ‹‚ğì‚ç‚È‚¢
"set nobackup
" ƒXƒƒbƒvƒtƒ@ƒCƒ‹‚ğì‚ç‚È‚¢
"set noswapfile
" •ÒW’†‚Ìƒtƒ@ƒCƒ‹‚ª•ÏX‚³‚ê‚½‚ç©“®‚Å“Ç‚İ’¼‚·
set autoread
" ƒoƒbƒtƒ@‚ª•ÒW’†‚Å‚à‚»‚Ì‘¼‚Ìƒtƒ@ƒCƒ‹‚ğŠJ‚¯‚é‚æ‚¤‚É
set hidden
" “ü—Í’†‚ÌƒRƒ}ƒ“ƒh‚ğƒXƒe[ƒ^ƒX‚É•\¦‚·‚é
set showcmd

set visualbell
" Œ©‚½–ÚŒn
" s”Ô†‚ğ•\¦
set number
" Œ»İ‚Ìs‚ğ‹­’²•\¦
set cursorline
" Œ»İ‚Ìs‚ğ‹­’²•\¦icj
"set cursorcolumn
" s––‚Ì1•¶šæ‚Ü‚ÅƒJ[ƒ\ƒ‹‚ğˆÚ“®‚Å‚«‚é‚æ‚¤‚É
set virtualedit=onemore
" ƒCƒ“ƒfƒ“ƒg‚ÍƒXƒ}[ƒgƒCƒ“ƒfƒ“ƒg
set smartindent
"autoindent
set autoindent
" ƒr[ƒv‰¹‚ğ‰Â‹‰»
set visualbell
" Š‡ŒÊ“ü—Í‚Ì‘Î‰‚·‚éŠ‡ŒÊ‚ğ•\¦
set showmatch
" ƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚ğí‚É•\¦
set laststatus=2
" ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“‚Ì•âŠ®
set wildmode=list:longest
" Ü‚è•Ô‚µ‚É•\¦s’PˆÊ‚Å‚ÌˆÚ“®‚Å‚«‚é‚æ‚¤‚É‚·‚é
nnoremap j gj
nnoremap k gk


" TabŒn
" •s‰Â‹•¶š‚ğ‰Â‹‰»(ƒ^ƒu‚ªu?-v‚Æ•\¦‚³‚ê‚é)
"set list listchars=tab:\?\-
" Tab•¶š‚ğ”¼ŠpƒXƒy[ƒX‚É‚·‚é
set expandtab
" s“ªˆÈŠO‚ÌTab•¶š‚Ì•\¦•iƒXƒy[ƒX‚¢‚­‚Â•ªj
set tabstop=2
" s“ª‚Å‚ÌTab•¶š‚Ì•\¦•
set shiftwidth=2


" ŒŸõŒn
" ŒŸõ•¶š—ñ‚ª¬•¶š‚Ìê‡‚Í‘å•¶š¬•¶š‚ğ‹æ•Ê‚È‚­ŒŸõ‚·‚é
set ignorecase
" ŒŸõ•¶š—ñ‚É‘å•¶š‚ªŠÜ‚Ü‚ê‚Ä‚¢‚éê‡‚Í‹æ•Ê‚µ‚ÄŒŸõ‚·‚é
set smartcase
" ŒŸõ•¶š—ñ“ü—Í‚É‡Ÿ‘ÎÛ•¶š—ñ‚Éƒqƒbƒg‚³‚¹‚é
set incsearch
" ŒŸõ‚ÉÅŒã‚Ü‚Ås‚Á‚½‚çÅ‰‚É–ß‚é
set wrapscan
" ŒŸõŒê‚ğƒnƒCƒ‰ƒCƒg•\¦
set hlsearch
" ESC˜A‘Å‚ÅƒnƒCƒ‰ƒCƒg‰ğœ
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ƒEƒBƒ“ƒhƒE‚Ìc•
"set lines=55
" ƒEƒBƒ“ƒhƒE‚Ì‰¡•
"set columns=180
" ƒJƒ‰[ƒXƒL[ƒ€
colorscheme molokai
let g:molokai_original = 1
syntax on
set t_Co=256
" ƒ_[ƒNŒn‚ÌƒJƒ‰[ƒXƒL[ƒ€‚ğg‚¤
"set background=dark
let mapleader = "\<Space>"

"noremap j gj
"noremap k gk
noremap <Leader>h ^
noremap <Leader>j }
noremap <Leader>k {
noremap <Leader>l $
noremap m  %
nnoremap <CR> A<CR><ESC>
nnoremap == gg=G''
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
inoremap <Leader>e <ESC><CR>
nnoremap <Leader>1 :q!<CR>
nnoremap <Leader>n  :NERDTree<CR>
inoremap jj <ESC>
nnoremap <Leader>s :set paste<CR>
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')


  "======================plugins ===============================
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-surround')
  call dein#add('Shougo/unite.vim') " ƒtƒ@ƒCƒ‹‘€ì‚Æ‚©
  call dein#add('Shougo/neocomplete.vim') " •âŠ®
  call dein#add('Shougo/neosnippet.vim') " ƒXƒjƒyƒbƒg
  call dein#add('Shougo/neosnippet-snippets') " ƒXƒjƒyƒbƒg
  call dein#add('itchyny/lightline.vim') " î•ñ‚ğŒ©‚â‚·‚­
  call dein#add('nathanaelkane/vim-indent-guides') " ƒCƒ“ƒfƒ“ƒg‚ğF•ª‚¯
  "call dein#add('Townk/vim-autoclose') " ƒJƒbƒR‚ğ©“®‚Å•Â‚¶‚é
  call dein#add('ujihisa/neco-look') " ‰p’PŒê‚Ì•âŠ®
  " ============================================================
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
	"autocmd VimEnter * execute 'NERDTree'
 "Required:
  call dein#end()
  call dein#save_state()
endif

"Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

" ------------------------------------------------------------
" ### neocomplete
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_lenth=2
let gLneocomplete#lock_buffer_name_pattern='\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" ### neco-look
if !exists('g:neocomplete#text_mode_filetypes')
  let g:neocomplete#text_mode_filetypes={}
endif
let g:neocomplete#text_mode_filetypes={
      \ 'rst' : 1,
      \ 'markdown' : 1,
      \ 'gitrebase' : 1,
      \ 'gitcommit' : 1,
      \ 'vcs-commit' : 1,
      \ 'hybrid' : 1,
      \ 'text' : 1,
      \ 'help' : 1,
      \ 'tex' : 1,
      \ }
"End dein Scripts-------------------------
