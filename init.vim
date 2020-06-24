let mapleader=" "

call plug#begin()
" colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'

" syntax helpers
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" linters
Plug 'w0rp/ale'

" code
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'

 "helpers
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

" git
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" do not forget to install jedi
Plug 'deoplete-plugins/deoplete-jedi'
" do not forget to install solargraph
Plug 'uplus/deoplete-solargraph'
call plug#end()

let g:deoplete#enable_at_startup = 1

set termguicolors
set guifont=Fira\ Code\ Retina\ 11
let ayucolor="mirage"
color ayu

set backspace=indent,eol,start
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set textwidth=80
set nu
set hlsearch
set laststatus=2
set updatetime=100
set smarttab
set incsearch
set laststatus=2
set ruler
set wildmenu
set autoread
set nobackup
set complete-=i
set title
set confirm
set wrap
set so=10
set noshowmode
set mouse+=a

map <Leader>, :w<CR>
inoremap <Leader>, <ESC>:w<CR>i
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>
map <Leader>[ :bprevious<CR>
map <Leader>] :bnext<CR>
map <Leader>l :buffers list<CR>
inoremap <Leader>f <ESC>:FZF<CR>
nnoremap <Leader>f :FZF<CR>
inoremap <Leader>g <ESC>:Rg<CR>
nnoremap <Leader>g :Rg<CR>
map <Leader>k :NERDTreeToggle <CR>
"let NERDTreeQuitOnOpen = 1
inoremap jj <ESC>:w<CR>
inoremap kk <ESC>:w<CR>
map <F7> gg=G<C-o><C-o>
nnoremap <C-n> :norm
map <silent> <C-n> <Plug>(ale_previous_wrap)
map <silent> <C-m> <Plug>(ale_next_wrap)
map <F4> :noh<CR>
map <C-c> :Goyo 80<CR>
map <leader>a :cclose <bar> lclose <bar> pclose<CR>

let g:lightline = {
     \ 'colorscheme': 'ayu',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             ['readonly', 'modified' ],
       \             ['absolutepath']],
       \   'right': [[ 'gitbranch'],
       \            ['filetype'],
       \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
       \ },
       \ 'component_function': {
       \   'gitbranch': 'gitbranch#name',
       \ },
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings= {
    \ 'javascript.jsx' : {
    \ 'extends': 'jsx',
    \ },
\}


" Set this variable to 1 to fix files when you save them.
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'css': ['prettier', 'stylelint'],
      \   'javascript': ['eslint', 'prettier'],
      \   'python': ['isort', 'black'],
      \   'HTML': ['HTMLHint', 'proselint'],
      \   'go': ['gofmt'],
      \   'ruby': ['rubocop'],
      \}
let g:ale_fix_on_save = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_buil_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_hightlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_command = "goimports"

" nerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1


  " functions
function SwitchColorScheme(name)
  let g:VIM_COLOR_SCHEME = a:name
  call ColorScheme()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! ColorScheme()
  if g:VIM_COLOR_SCHEME ==# 'night-owl'
    " Lazy load theme in
    colorscheme night-owl
    let g:lightline.colorscheme = 'nightowl'
  endif


  if g:VIM_COLOR_SCHEME ==# 'monokai'
    " Lazy load theme in
    colorscheme vim-monokai-tasty
    let g:lightline.colorscheme = 'molokai'
  endif

  if g:VIM_COLOR_SCHEME ==# 'nord'
    " Lazy load theme in
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
    let g:nord_italic = 1
    let g:nord_cursor_line_number_background = 1
    colorscheme nord
    let g:lightline.colorscheme = 'nord'
  endif

  if g:VIM_COLOR_SCHEME ==# 'ayu-light'
    colorscheme ayu
    let g:ayucolor="light"
    set background=light
    let g:lightline.colorscheme = 'default'
  endif

  if g:VIM_COLOR_SCHEME ==# 'ayu'
    colorscheme ayu
    set background=dark
    let g:ayucolor="mirage"
    let g:lightline.colorscheme = 'ayu'
  endif


endfunction
" Defaults
:call SwitchColorScheme("ayu")
