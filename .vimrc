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
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'

"加上/解开注释, 智能判断
" >>
" 工程文件浏览
Plugin 'winmanager'
"Plugin 'scrooloose/nerdtree'
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

" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/a.vim'
"Tagbar........................................................................................
Plugin 'Tagbar'
let g:TagbarToggle = 'tb'
nmap <F9> :TagbarToggle<CR>
""Tagbar........................................................................................

Plugin 'gtags.vim'
Plugin 'vim-gutentags'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0



autocmd BufRead,BufNewFile *.mm :set ft=cpp

Plugin 'terryma/vim-multiple-cursors'
Plugin 'rdnetto/YCM-Generator'
Plugin 'Valloric/YouCompleteMe'
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#F0F8FF
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
let g:ycm_path_to_python_interpreter="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3"
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
"set tags=tag;/
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_use_clangd = 0
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

"let g:ycm_global_ycm_extra_conf = ''
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'


au CursorHold * checktime
Plugin 'fholgado/minibufexpl.vim'
Plugin 'AutoComplPop'
Plugin 'wellcomez/project.vim'
"cscope
Plugin 'cscope.vim'
Plugin 'cscope-menu'
Plugin 'autoload_cscope.vim'
set cscopequickfix=s-,c-,d-,i-,t-,e-  
set cscopeprg=gtags-cscope
cs add GTAGS
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>r :Gtags -r<C-R>=expand("<cword>")<CR><CR>

Plugin 'airblade/vim-gitgutter'

"ctrlp...............................................................................................
Plugin 'ctrlp.vim'
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
noremap <C-W><C-U> :CtrlPMRU<CR>
noremap <C-W><C-R> :CtrlPBufTag<CR>
nnoremap <C-W>u :CtrlPMRU<CR>


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


" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'


"Plugin 'pseewald/nerdtree-tagbar-combined'
"autocmd vimenter * ToggleNERDTreeAndTagbar 
call vundle#end()


call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
autocmd BufReadPost *.* exec 'botright copen' 
autocmd BufReadPost *.* call tagbar#autoopen()
exec 'colorscheme molokai'

"exec 'Tagbar'
"function! CompileLess()
