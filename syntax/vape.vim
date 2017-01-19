" Vim syntax file
" Language: Vape
" Maintainer: Andrew Vy <andrew@andrewvy.com>
" Last Change: $Date: $
"
" $Id: $
"
" Copyright <YEAR> <COPYRIGHT HOLDER>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword vapeConditional case else if when
syn keyword vapeImport import
syn keyword vapeKeyword function object new

" Operators
syn match vapeOperator "\([-!#$%`&\*\+./<=>\?@\\^|~:]\|\<_\>\)"

" Delimiters
syn match vapeDelimiter  "[,;]"
syn match vapeBraces  "[()[\]{}]"

" Comments
syn keyword vapeTodo TODO FIXME XXX contained
syn match vapeLineComment "#.*" contains=vapeTodo,@spell
syn region vapeComment matchgroup=vapeComment start="{-|\=" end="-}" contains=vapeTodo,vapeComment,@spell

" Strings
syn match vapeStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match vapeStringEscape "\\[nrfvbt\\\"]" contained
syn region vapeString start="\"" skip="\\\"" end="\"" contains=vapeStringEscape,@spell
syn region vapeTripleString start="\"\"\"" skip="\\\"" end="\"\"\"" contains=vapeStringEscape,@spell
syn match vapeChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" Numbers
syn match vapeInt "-\?\<\d\+\>\|0[xX][0-9a-fA-F]\+\>"
syn match vapeFloat "\(\<\d\+\.\d\+\>\)"

" Identifiers
syn match vapeTopLevelDecl "^\s*[a-zA-Z][a-zA-z0-9_]*\('\)*\s\+:\s\+" contains=vapeOperator
syn match vapeType "\<[A-Z][0-9A-Za-z_'-]*"

hi def link vapeTopLevelDecl Function
hi def link vapeTodo Todo
hi def link vapeComment Comment
hi def link vapeLineComment Comment
hi def link vapeString String
hi def link vapeTripleString String
hi def link vapeChar String
hi def link vapeStringEscape Special
hi def link vapeInt Number
hi def link vapeFloat Float
hi def link vapeDelimiter Delimiter
hi def link vapeBraces Delimiter
hi def link vapeImport Include
hi def link vapeConditional Conditional
hi def link vapeAlias Delimiter
hi def link vapeType Identifier
hi def link vapeOperator Operator
hi def link vapeKeyword Special

let b:current_syntax = "vape"
