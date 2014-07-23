set nocompatible              " be iMproved
filetype off                  " required!
colorscheme desert 
filetype plugin on
filetype plugin indent on     " required!
set completeopt=longest,menu
set modifiable
set mouse=a
set ignorecase
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'filetype.vim'

""CCTree....................................................................................
"Plugin 'CCTree'
"cctree
"let CCTreeEnhancedSymbolProcessing = 1
"let g:CCTreeKeyTraceForwardTree = '<C-\>>'
"let g:CCTreeKeyTraceReverseTree = '<C-\><'
"let g:CCTreeKeyHilightTree = '<C-l>' 
"let g:CCTreeKeySaveWindow = '<C-\>y' 
"let g:CCTreeKeyToggleWindow = '<C-\>w'
"let g:CCTreeKeyCompressTree = 'zs'   
"let g:CCTreeKeyDepthPlus = '<C-\>=' 
"let g:CCTreeKeyDepthMinus = '<C-\>-'
""CCTree....................................................................................


"Tagbar........................................................................................
"Plugin 'Tagbar'
"let g:TagbarToggle = 'tb'
"nmap <F9> :TagbarToggle<CR>
"Tagbar........................................................................................



" My Plugins here:
"
" original repos on GitHub
"Plugin 'tpope/vim-fugitive'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
"" vim-scripts repos
"Plugin 'L9'
Plugin 'winmanager'
Plugin 'ctags.vim'
"Plugin 'TagsMenu.zip'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'gtags.vim'
"Plugin 'GtagsClient'
"Plugin 'gtags-multiwindow-browsing'
" non-GitHub repos
" Plugin 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
set completeopt=longest,menu

Plugin 'cocoa.vim'
Plugin 'nagios-syntax'


"Taglist
" F4:  Switch on/off TagList
"nnoremap <unique> <silent> <F4> :TlistToggle<CR>
"nnoremap <unique> <silent> <F1> :NERDTreeToggle <CR>
Plugin 'taglist.vim'
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool 
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself 
let Tlist_Use_Right_Window = 1 " split to the right side of the screen 
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 0 " Close the taglist window when a file or tag is selected.
let Tlist_BackToEditBuffer = 0 " If no close on select, let the user choose back to edit buffer or not
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let Tlist_Compact_Format = 1 " do not show help
"let Tlist_Ctags_Cmd ="/Users/zhujialai/Downloads/ctags-ObjC-5.8.1-master/ctags"
"/usr/bin/ctags"
autocmd BufRead,BufNewFile *.mm :set ft=objc
"let tlist_objc_settings    = 'ObjectiveC;i:interface;c:class;m:method;p:property'
let tlist_objc_settings    = 'ObjC;i:interface;P:property;I:implementations;M:instanceMethod;C:methods;Z:protocols'

"cscope
Plugin 'cscope.vim'
Plugin 'cscope-menu'
Plugin 'autoload_cscope.vim'
set cscopequickfix=s-,c-,d-,i-,t-,e-  
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>r :Gtags -r<C-R>=expand("<cword>")<CR><CR>



"OmniCppComplete
"Plugin 'OmniCppComplete'
"set nocp
"filetype plugin on

"MiniBufExplorer
Plugin 'minibufexplorerpp'
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0



"NerdTree
Plugin 'The-NERD-tree'
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction
nmap wm :WMToggle<CR>

"grep
Plugin 'grep.vim'

Plugin 'project.vim'
Plugin 'NERD_tree-Project'
Plugin 'sessionman.vim'

"目录
"ctrlp...............................................................................................
Plugin 'ctrlp.vim'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
let g:ctrlp_max_height = 100
let g:ctrlp_max_files =0 
let g:ctrlp_by_filename = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
"ctrlp...............................................................................................
"Plugin 'FuzzyFinder'
"Plugin 'Command-T'

"'OmniCppComplete'OmniCppCompleteOmniCppCompleteOmniCppCompleteOmniCppCompleteOmniCppComplete
Plugin 'OmniCppComplete'
"OmniCppComplete'OmniCppCompleteOmniCppCompleteOmniCppCompleteOmniCppCompleteOmniCppComplete

"clang"---------------------------------------------------------------------------------------------------------
Plugin 'clang-complete'
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"clang"---------------------------------------------------------------------------------------------------------

Plugin 'AutoComplPop'
"supertab
Plugin 'SuperTab'
"clang"---------------------------------------------------------------------------------------------------------

"jedi+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plugin 'wellcomez/jedi-vim'
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-p>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
"jedi+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"Plugin 'lua.vim'
"Plugin 'lua_omni'

"Plugin 'javascript.vim'
Plugin 'JavaScript-syntax'
Plugin 'Better-Javascript-Indentation'
Plugin 'jquery'
Plugin 'neocomplcache'
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
Plugin 'XQuery-indentomnicompleteftplugin'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

Plugin 'marijnh/tern_for_vim'



Plugin 'a.vim'
Plugin 'The-NERD-Commenter'
Plugin 'EasyMotion'



" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"




"
"Plugin 'Valloric/YouCompleteMe'
Plugin 'joonty/vdebug'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

