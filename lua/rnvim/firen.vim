let g:firenvim_config = {
  \ 'globalSettings': {
    \ 'alt': 'all',
  \  },
  \ 'localSettings': {
    \ '.*': {
      \ 'cmdline': 'neovim',
      \ 'content': 'text',
      \ 'priority': 0,
      \ 'selector': 'textarea',
      \ 'takeover': 'never',
    \ },
  \ }
\ }

if exists('g:started_by_firenvim')
  set laststatus=0
  set wrap
  set linebreak
  set showbreak=~
  nnoremap j gj
  nnoremap k gk
  au BufEnter github.com_*.txt set filetype=markdown
endif
