let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ]
      \           ],
      \   'right': [
      \     ['lineinfo'],
      \     ['percent'],
      \     ['charcode', 'fileformat', 'filetype'],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'filename': '%f'
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\u2b64"
  else
    return ""
  endif
endfunction
