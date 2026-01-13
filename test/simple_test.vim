" Simple local test harness for syntax highlighting
" Run with: vim -Nu test/vimrc -S test/simple_test.vim

set nocompatible
set rtp^=.
filetype plugin indent on
syntax enable

" Test counter
let s:passed = 0
let s:failed = 0
let s:tests = []

function! RunTest(name, code, keyword, expected_group)
  " Create new buffer
  enew!

  " Insert code FIRST
  call setline(1, split(a:code, '\n'))

  " THEN set syntax and force reload
  unlet! b:current_syntax
  set filetype=solidity
  runtime! syntax/solidity.vim
  syntax sync fromstart

  " Find keyword
  call cursor(1, 1)
  let l:found = search(a:keyword, 'w')

  if l:found == 0
    let l:result = 'FAIL: keyword not found'
    let s:failed += 1
    call add(s:tests, {'name': a:name, 'status': 'FAIL', 'reason': 'keyword not found'})
    return
  endif

  " Check syntax group
  let l:synid = synID(line('.'), col('.'), 1)
  let l:group = synIDattr(l:synid, 'name')
  let l:word = expand('<cword>')
  let l:line_content = getline('.')

  if l:group ==# a:expected_group
    let s:passed += 1
    call add(s:tests, {'name': a:name, 'status': 'PASS', 'group': l:group})
  else
    let s:failed += 1
    call add(s:tests, {'name': a:name, 'status': 'FAIL', 'expected': a:expected_group, 'got': l:group, 'word': l:word, 'line': l:line_content, 'pos': line('.') . ':' . col('.')})
  endif
endfunction

" Run tests
echo "Running syntax tests...\n"

call RunTest(
  \ 'transient keyword',
  \ "contract Test {\n    transient uint256 value;\n}",
  \ 'transient',
  \ 'solKeyword'
  \ )

call RunTest(
  \ 'uint256 builtin type',
  \ 'uint256 value;',
  \ 'uint256',
  \ 'solBuiltinType'
  \ )

call RunTest(
  \ 'unchecked keyword',
  \ "function test() public {\n    unchecked {\n        x++;\n    }\n}",
  \ 'unchecked',
  \ 'solKeyword'
  \ )

call RunTest(
  \ 'error keyword',
  \ 'error InsufficientBalance(uint256 available, uint256 required);',
  \ 'error',
  \ 'solKeyword'
  \ )

call RunTest(
  \ 'fallback keyword',
  \ 'fallback() external payable {}',
  \ 'fallback',
  \ 'solKeyword'
  \ )

call RunTest(
  \ 'receive keyword',
  \ 'receive() external payable {}',
  \ 'receive',
  \ 'solKeyword'
  \ )

" Print results
let s:output = []
call add(s:output, "\n" . repeat('=', 60))
call add(s:output, "Test Results")
call add(s:output, repeat('=', 60) . "\n")

for test in s:tests
  if test.status ==# 'PASS'
    call add(s:output, '✓ PASS: ' . test.name . ' (' . test.group . ')')
  else
    call add(s:output, '✗ FAIL: ' . test.name)
    if has_key(test, 'expected')
      call add(s:output, '  Expected: ' . test.expected)
      call add(s:output, '  Got: "' . test.got . '"')
      if has_key(test, 'word')
        call add(s:output, '  Word: ' . test.word)
        call add(s:output, '  Line: ' . test.line)
        call add(s:output, '  Position: ' . test.pos)
      endif
    else
      call add(s:output, '  Reason: ' . test.reason)
    endif
  endif
endfor

call add(s:output, "\n" . repeat('=', 60))
call add(s:output, 'Total: ' . (s:passed + s:failed) . ' | Passed: ' . s:passed . ' | Failed: ' . s:failed)
call add(s:output, repeat('=', 60))

" Write results to file and stdout
call writefile(s:output, '/tmp/vim-solidity-test-results.txt')

" Also print to screen
for line in s:output
  echomsg line
endfor

" Exit with appropriate code
if s:failed > 0
  cquit 1
else
  qall!
endif
