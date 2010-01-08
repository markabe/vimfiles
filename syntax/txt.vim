" Vim syntax file
" Language: Txt
" Author:   Mark Bennett
" Filenames: *.txt

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match txtTitle /++.*/
syn match txtSection /\*.*\*/
syn match txtComment /#.*/
syn match txtQuestion /?.*/
syn match txtDependency /\[.*]/
syn match txtPositive /+\w.*/
syn match txtNegative /$.*/

hi def link txtTitle Identifier
hi def link txtSection String
hi def link txtComment Comment
hi def link txtQuestion Preproc
hi def link txtDependency Keyword
hi def link txtPositive Special
hi def link txtNegative Exception

let b:current_syntax="txt"
