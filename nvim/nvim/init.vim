" 更新时间：2016-03-30 12:15:21

" 定义快捷键的前缀，即 <Leader>
let mapleader="\\"
" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
set mouse=a
" <<

" >>
" vim 自身（非插件）快捷键

" 定义快捷键到行首和行尾
"inoremap `` <Esc>
set autoread

" 让配置变更立即生效

" >>
" 其他

" 开启实时搜索功能
"set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<

" vundle 环境设置
filetype off

" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
nmap <Leader>as <Plug>(AerojumpSpace)
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
nmap <Leader>ad <Plug>(AerojumpDefault) " Boring mode

Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }


"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-prettier']
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
Plug  'ap/vim-css-color'
Plug  '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

"fzf
Plug  'junegunn/fzf'
Plug  'junegunn/fzf.vim'
noremap <C-R> :BTags<CR>
"noremap <C-P> :Files<CR>
map <Leader>bb :Buffers<cr>
let g:fzf_layout = {'left': '30%'}
"fzf

"Leaderf
"Plug 'rking/ag.vim'
"map <Leader>rg <C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
"noremap <C-R> :LeaderfFunction<CR>
"noremap <C-P> :LeaderfFile<CR>
"map <Leader>bb :LeaderfBuffer<cr>
"LeaderF

Plug  'flazz/vim-colorschemes'
Plug  'SirVer/ultisnips'
Plug  'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-t>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"加上/解开注释, 智能判断
" >>
" 工程文件浏览
Plug  'vim-scripts/winmanager'
Plug  'scrooloose/nerdtree'
"" 工程文件浏览
"" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
"nmap wm :NERDTreeToggle<CR>
"" 设置 NERDTree 子窗口宽度
"let NERDTreeWinSize=22
"" 设置 NERDTree 子窗口位置
"let NERDTreeWinPos="left"
"" 显示隐藏文件
"let NERDTreeShowHidden=1
"" NERDTree 子窗口中不显示冗余帮助信息
"let NERDTreeMinimalUI=1
"" 删除文件时自动删除文件对应 buffer
"let NERDTreeAutoDeleteBuffer=1
"" >>
" 多文档编辑
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
map <Leader>cl :CocList<cr>
let g:miniBufExplMaxSize = 5
"let g:miniBufExplCloseOnSelect = 1
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>


Plug  'vim-scripts/a.vim'
"Tagbar........................................................................................
"Plug  'vim-scripts/Tagbar'
"let g:tagbar_type_typescript = {                                                  
  "\ 'ctagsbin' : 'tstags',                                                        
  "\ 'ctagsargs' : '-f-',                                                           
  "\ 'kinds': [                                                                     
    "\ 'e:enums:0:1',                                                               
    "\ 'f:function:0:1',                                                            
    "\ 't:typealias:0:1',                                                           
    "\ 'M:Module:0:1',                                                              
    "\ 'I:import:0:1',                                                              
    "\ 'i:interface:0:1',                                                           
    "\ 'C:class:0:1',                                                               
    "\ 'm:method:0:1',                                                              
    "\ 'p:property:0:1',                                                            
    "\ 'v:variable:0:1',                                                            
    "\ 'c:const:0:1',                                                              
  "\ ],                                                                            
  "\ 'sort' : 0                                                                    
"\ }       



"let g:tagbar_type_typescript = { 
"\ 'ctagstype': 'typescript', 
    "\ 'kinds': [ 
            "\ 'c:classes', 
            ""\ 'n:modules', 
            "\ 'f:functions', 
            "\ 'v:variables', 
            "\ 'v:varlambdas', 
            "\ 'm:members', 
            "\ 'i:interfaces', 
            "\ 'e:enums', 
            "\ ] 
"\}
"jsctags
"Plug  'ternjs/tern_for_vim'
"Plug  'ramitos/jsctags'
"let g:tagbar_type_javascript = {
      "\ 'ctagsbin' : 'jsctags'
"      \ }
"jsctags

"let g:TagbarToggle = 'tb'
"nmap <F9> :TagbarToggle<CR>
""Tagbar........................................................................................


"vista
Plug 'liuchengxu/vista.vim'
nmap <F9> :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"vista

"gtags-------------------------
"Plug  'gtags.vim'
"Plug  'ludovicchabant/vim-gutentags'
"" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = '.tags'

"" 同时开启 ctags 和 gtags 支持：
"let g:gutentags_modules = []
""if executable('ctags')
	""let g:gutentags_modules += ['ctags']
""endif
"if executable('gtags-cscope') && executable('gtags')
	"let g:gutentags_modules += ['gtags_cscope']
"endif

"" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let g:gutentags_cache_dir = expand('~/.cache/tags')

"" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

"" 禁用 gutentags 自动加载 gtags 数据库的行为
"let g:gutentags_auto_add_gtags_cscope = 0
"Plug  'skywind3000/gutentags_plus'
"" change focus to quickfix window after search (optional).
"let g:gutentags_plus_switch = 1
"gtags-------------------------

"coc_nvim
"" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <leader>l :call     CocAction('runCommand', 'eslint.executeAutofix')
xmap <leader>l :call     CocAction('runCommand', 'eslint.executeAutofix')
" Add status line support, for integration with other plugin, checkout `:h coc-status`

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
  ".' '.get(b:,'coc_current_function','')
endfunctio
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}%{StatusDiagnostic()}
"Plug  'Lokaltog/vim-powerline'

"lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

Plug  'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'method','readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
set laststatus=2

""lightline

"airline------
"Plug  'vim-airline/vim-airline'
"Plug  'vim-airline/vim-airline-themes'
"let g:airline#extensions#coc#enabled = 1
"let airline#extensions#coc#error_symbol = 'e:'
"let airline#extensions#coc#warning_symbol = 'w:'
"let airline#extensions#coc#stl_format_err = '%e{[%e(#%fe)]}'
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"airline------



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Do default action for previous item.
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"coc_nvim
"nnoremap <silent> <space> <C-d>

" grep word under cursors
"
Plug 'jremmen/vim-ripgrep'
map <Leader>ag :Ag  <C-R>=expand("<cword>")<CR><CR>
map <Leader>rg :Rg  <C-R>=expand("<cword>")<CR><CR>

nnoremap <silent> <space>w  :CocSearch  <C-R>=expand("<cword>")<CR><CR>
"coc_nvim


autocmd BufRead,BufNewFile *.mm :set ft=cpp

Plug  'terryma/vim-multiple-cursors'


au CursorHold * checktime
Plug  'fholgado/minibufexpl.vim'
Plug  'vim-scripts/AutoComplPop'
"Plug  'wellcomez/project.vim'
"cscope
"Plug  'cscope.vim'
"Plug  'cscope-menu'
"Plug  'autoload_cscope.vim'
"set cscopequickfix=s-,c-,d-,i-,t-,e-  
"set cscopeprg=gtags-cscope
"
nmap <C-_>s :GscopeFind s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :GscopeFind g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :GscopeFind c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :GscopeFind t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :GscopeFind e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :GscopeFind f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :GscopeFind i ^<C-R>=expand("<cfile>")<CR>$<CR>
"autocmd vimenter * ToggleNERDTreeAndTagbar 
nmap <C-_>d :GscopeFind d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>r :Gtags -r<C-R>=expand("<cword>")<CR><CR>
nmap <silent>gc :GtagsCursor -r<C-R>=expand("<cword>")<CR><CR>
nmap <F4> :cn<CR>
nmap <F3> :cp<CR>
Plug  'airblade/vim-gitgutter'
Plug  'tpope/vim-fugitive'
Plug  'neoclide/vim-easygit'
let g:easygit_enable_command = 1

"ctrlp...............................................................................................
Plug  'vim-scripts/ctrlp.vim'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/gradle/*,*/node_modules/*,        " Linux/MacOSX
let g:ctrlp_max_height = 100
let g:ctrlp_max_files =0 
let g:ctrlp_by_filename = 0
let g:ctrlp_clear_cache_on_exit = 0
"let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '|node_modules\|\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"noremap <C-W><C-U> :CtrlPMRU<CR>
""noremap <C-W><C-R> :CtrlPBufTag<CR>
"nnoremap <C-W>u :CtrlPMRU<CR>

Plug  'scrooloose/nerdcommenter'

" 插件列表结束
filetype plugin indent on
" <<<<
on
" 配色方案
" 
if has("gui_running")
    set background=dark
    colorscheme evening
else
    colorscheme darkblue 
endif

set laststatus=2

set ruler

set number

set cursorline
set cursorcolumn

" 高亮显示搜索结果
" set hlsearch


" 禁止折行
set nowrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 缩进
" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4




call plug#end()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
colorscheme molokai
