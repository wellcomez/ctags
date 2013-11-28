set nocompatible              " be iMproved
filetype off                  " required!
colorscheme darkblue
set mouse=a
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'filetype.vim'
Bundle 'CCTree'
"cctree
"let CCTreeEnhancedSymbolProcessing = 1
let g:CCTreeKeyTraceForwardTree = '<C-\>>'
let g:CCTreeKeyTraceReverseTree = '<C-\><'
let g:CCTreeKeyHilightTree = '<C-l>' 
let g:CCTreeKeySaveWindow = '<C-\>y' 
let g:CCTreeKeyToggleWindow = '<C-\>w'
let g:CCTreeKeyCompressTree = 'zs'   
let g:CCTreeKeyDepthPlus = '<C-\>=' 
let g:CCTreeKeyDepthMinus = '<C-\>-'

Bundle 'Tagbar'
let g:TagbarToggle = 'tb'
"nmap <F9> :TagbarToggle<CR>
"
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'winmanager'
Bundle 'OmniCppComplete'
Bundle 'ctags.vim'
"Bundle 'TagsMenu.zip'
Bundle 'AutoComplPop'
"Bundle 'Powerline'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'gtags.vim'
"Bundle 'GtagsClient'
"Bundle 'gtags-multiwindow-browsing'
colorscheme darkblue
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
set completeopt=longest,menu
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"

Bundle 'cocoa.vim'
Bundle 'nagios-syntax'
Bundle 'clang-complete'


"Taglist
" F4:  Switch on/off TagList
"nnoremap <unique> <silent> <F4> :TlistToggle<CR>
"nnoremap <unique> <silent> <F1> :NERDTreeToggle <CR>
Bundle 'taglist.vim'
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
Bundle 'cscope.vim'
Bundle 'cscope-menu'
Bundle 'autoload_cscope.vim'
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


"supertab
Bundle 'SuperTab'
let g:SuperTabDefaultCompletionType="context"  

"OmniCppComplete
set nocp
filetype plugin on

"MiniBufExplorer
Bundle 'minibufexplorerpp'
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0



"NerdTree
Bundle 'The-NERD-tree'
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
Bundle 'grep.vim'
nnoremap <silent> <F3> :Grep<CR>

"Bundle 'project.tar.gz'
Bundle 'project.vim'
Bundle 'NERD_tree-Project'
Bundle 'sessionman.vim'


Bundle 'ctrlp.vim'
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
let g:ctrlp_max_height = 100
let g:ctrlp_max_files =0 
let g:ctrlp_by_filename = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
"noremap <C-W><C-U> :CtrlPMRU<CR>
"nnoremap <C-W>u :CtrlPMRU<CR>

Bundle 'genutils'
"Bundle 'lookupfile'
"Bundle 'Command-T'
""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""



"Bundle 'Acpp'
Bundle 'a.vim'
Bundle 'The-NERD-Commenter'
Bundle 'EasyMotion'
