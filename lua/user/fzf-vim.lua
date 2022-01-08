vim.cmd [[
" *************** fzf
set rtp+=/usr/local/opt/fzf
function! s:build_quickfix_list(lines)
  call setqflist([], ' ', { 'title': 'FZF Selected', 'items': map(copy(a:lines), '{ "filename": v:val }') })
  copen
  cc
endfunction

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'NonText', 'rounded': v:true, 'relative': v:false, 'yoffset': '0.5' } }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9, 'highlight': 'NonText', 'rounded': v:true } }
let g:fzf_preview_window = ['up:68%', 'ctrl-/']

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Background'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'WilderPopupMenuSelectedAccent'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Normal'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
  
let $FZF_DEFAULT_OPTS='--info=inline
  \ --bind ctrl-y:preview-up,ctrl-e:preview-down,
  \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
  \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 0

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" Mapping selecting mappings
" nmap <leader>Hm <plug>(fzf-maps-n)
" xmap <leader>Hm <plug>(fzf-maps-x)
" omap <leader>Hm <plug>(fzf-maps-o)

" select and close buffers.
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction

" autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" nmap <Leader>ph :History<CR>
" nmap <Leader>hw :Windows<CR>
" nmap <Leader>hcb :Commits<CR>
" nmap <Leader>hf :Files<CR>
" nmap <Leader>Hc :Colors<CR>
" nmap <Leader>Ht :Helptags<CR>
" nmap <Leader>Hf :Filetypes<CR>
" nmap <leader>Hm :Maps<CR>
" nmap <leader>Hk :Commands<CR>
" nmap <Leader>th :Helptags<CR>

" Marks keybinding
" nmap <Leader>mm :Marks<CR>

" Files keybinding
map <Leader>ff :Files<cr>
map <Leader>fo :GFiles<cr>
map <Leader>fg :GFiles?<cr>
map <Leader>fr :History<cr>
map <Leader>fl :Buffers<cr>
map <Leader>f/ :History/<cr>
map <Leader>f; :History:<cr>
map <Leader>fm :Marks<cr>

" Git keybinding
" nmap <Leader>gs :Git<CR>
" nmap <Leader>gS :GFiles?<CR>
" nmap <Leader>gc :Commits<CR>
" nmap <Leader>gn :Neogit<CR>
" nmap <Leader>gf :GFiles<CR>
" nmap <Leader>gP :Gpush<CR>
" nmap <Leader>gF :call fzf#vim#gitfiles('', fzf#vim#with_preview('up'))<CR>

" Project keybinding
" nmap <Leader>ph :Files<CR>
" nmap <Leader>tt :Tags<CR>
" nmap <Leader>pg :GFiles<CR>
" nmap <Leader>pz :Tags<CR>
" nmap <Leader>pa :Ag<CR>
"
" Buffers keybinding
" nmap <Leader>bb :Buffers<CR>
" nmap <Leader>bc :BD<CR>
" nmap <Leader>bn :bn<CR>
" nmap <Leader>bp :bp<CR>
" nmap <Leader>bd :bp<CR>:bd#<CR>
" nmap <Leader>bd :Bclose<CR>
" nmap <Leader>bk :Bclose!<CR>
" nmap <Leader>tb :BTags<CR>
" nmap <Leader>bt :BTags<CR>

" Search keybinding
" current buffer lines
nmap <Leader>ss :BLines<CR>
" loaded buffers lines
nmap <Leader>sl :Lines<CR>
" Windows
" nmap <Leader>sw :Windows<CR>
" Buffer Tags
nmap <Leader>st :BTags<CR>
" Rg Preview
nmap <Leader>sr :Rg<CR>
" Rg select
nmap <Leader>sR :Rg!<CR>

" RG Fuzzy
nmap <Leader>sf :RG<CR>
nmap <Leader>sF :RG!<CR>
" git grep
nmap <Leader>sg :GGrep<CR> 
" search history
nmap <Leader>sh :History/<CR>
" command history
nmap <Leader>sc :History:<CR>
nmap <Leader>sa :AGP<CR>
nmap <Leader>sA :Ag!<CR>
nmap <Leader>fw :Find<CR>

" nmap <Leader>gF :call fzf#vim#gitfiles('', fzf#vim#with_preview('up'))<CR>
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1,
  \   fzf#vim#with_preview('up:60%'),
  \   <bang>0)

" neovim config
command! -bang NeovimConfigFiles 
      \ call fzf#vim#files(
      \ '~/.config/nvim',
      \ fzf#vim#with_preview('up:60%'),
      \ <bang>0)
nmap <Leader>fef :NeovimConfigFiles<CR>

autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

command! -bang -nargs=* HistoryNoPreview
      \ call fzf#vim#command_history(<q-args>, &columns > 200 ? fzf#vim#with_preview() : {}, <bang>0)

command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, &columns > 110 ?  fzf#vim#with_preview({'source': 'ag --hidden --ignore .git -g ""'}) : {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, &columns > 180 ? fzf#vim#with_preview({'options': ['--info=inline']}) : {}, <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   &columns > 180 ? fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}) : {}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   &columns > 180 ? fzf#vim#with_preview() : {}, <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, &columns > 180 ? fzf#vim#with_preview(spec) : {}, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -nargs=* Ag2 call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all',
\ 'down':    '25%'
\ })

command! -bang -nargs=* AGP
  \ call fzf#vim#ag(<q-args>,
  \   fzf#vim#with_preview('up:60%'),
  \  <bang>0)

nnoremap <silent> <Leader>HC :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    50
\ })<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>br :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
]]
