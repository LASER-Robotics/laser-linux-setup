" set path for filename suggestions
" ** means "in any subfolder"
set path+=~/git/**

" where should vim look for the tags?
" tags are generated by ctags utility
" multiple paths should be separated by comma
set tags+=~/tags,~/tags-once

" build 1
map <Leader>m :call VimuxRunCommand("cd ~/ros_workspace; catkin build")<CR>
"map <Leader>m :call VimuxRunCommand("cd ~/timepix_workspace; catkin build")<CR>
" build2
map <Leader>j :call VimuxRunCommand("cd ~/ros_workspace; catkin build visual_servoing")<CR>
"map <Leader>j :call VimuxRunCommand("cd ~/timepix_workspace; catkin build rospix")<CR>
" close the vimmux window
map <Leader>l :VimuxCloseRunner<CR>
" building ctags
command! MakeTags :call VimuxRunCommand("generateTags; :q")<CR>
"
"""""""""""""""""""""""""""""""

" customize bookmarks in startify
let g:startify_bookmarks = [
      \ { 'b': '~/.bashrc' },
      \ { 't': '~/.tmux.conf' },
      \ { 'v': '~/.vimrc' },
      \ { 'm': '~/.my.vimrc' },
      \ { 's': '~/git/linux-setup/appconfig/vim/dotvim/after/snippets/_.snippets' },
      \ { 'p': '~/git/linux-setup/appconfig/vim/startify_quotes.txt' },
      \ ]

" because of latex
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" scrolling in autocomplete menu with j and k
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" let l behave the same as enter in completion menu
inoremap <expr> l ((pumvisible())?("\<C-y>"):("l"))

" remap right and left in normal mode to juping back and forth on f,t
nnoremap <left> ,
nnoremap <right> ;

" Useful bubble text normal mapping for arrow keys.                                                                                        
nnoremap <UP> ddkP 
nnoremap <DOWN> ddp
vnoremap <DOWN> xp`[V`]
vnoremap <UP> xkP`[V`]
