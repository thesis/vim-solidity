" Comment settings
setlocal comments=s1:/*,mb:*,ex:*/,:///,://
setlocal commentstring=//\ %s
setlocal formatoptions+=croqn

" Detect file type based on extension
if expand('%:t') =~? '\.t\.sol$'
    let b:solidity_file_type = 'test'
elseif expand('%:t') =~? '\.s\.sol$'
    let b:solidity_file_type = 'script'
else
    let b:solidity_file_type = 'contract'
endif
