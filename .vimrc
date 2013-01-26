filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set tabstop=4
set expandtab
set shiftwidth=4 
set foldmethod=indent
set foldlevel=99
map <leader>n :NERDTreeToggle<CR>
map <leader>td <Plug>TaskList
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
au FileType python set omnifunc=pythoncomplete#Complete
nmap <leader>a <Esc>:Ack!
let g:SuperTabDefaultCompletionType = "context"
set statusline+=%{fugitive#statusline()}
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
