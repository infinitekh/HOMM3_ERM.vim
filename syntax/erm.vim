" Vim syntax file
" Language:	ERM
" Maintainer:	KIM Hyeok <ekh0324@gmail.com>
" Last Change:	2020-04-27

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif


syn match ermReceiver "\(!!\)\([A-Za-z]\{2}\)"
syn match ermFunctionCall "\(!!FU\)\(\(\(\d\+\)\|\(([^)]\+)\)\)\)"
syn match ermIF "![#!]SN\zs\([&|].\{-0,}\)\ze:"
syn match ermIF1 "!!if\([&|].\{-0,}\)\ze:"
syn match ermReceiverHero "\(![#!]HE\)\(-1\|\d\{1,3}\|[xyvzwefc]\%(-\?\d\+\)\)"
"syn cluster ermIF contains=ermReceiverIF,ermReceiverIF
hi def link ermReceiver   Function 
hi def link ermFunctionCall Function
hi def link ermIF   Conditional 
hi def link ermIF1  Conditional
hi def link ermReceiverHero Function


syn match ermInstruction "\(!#\)\([A-Za-z]\{2}\)"
hi def link ermInstruction  Function
syn match ermFunctionDefinition "\(!?FU\)\(\(\(\d\+\)\|\(([^)]\+)\)\)\)"
hi def link ermFunctionDefinition Define

syn match ermTrigger "\(![?$]\(FU\)\@![A-Z]\{2}\)"
hi def link ermTrigger Define


syn match ermBeginKeyword "\%^ZVSE"
hi def link ermBeginKeyword		Exception

syn match ermCommentBegin "\(^\|;\)\zs[^!]\+\ze\(!!\|$\)"
syn match ermCommentLine "^\s*[^!].*"
syntax region ermComment start="\[" end="\]" 
hi def link ermComment Comment
hi def link ermCommentBegin Comment
hi def link ermCommentLine Comment


syn match ermVariable "\([g-t]\|[xyvzwefc]\)\%(-\?\d\+\)"
syn match ermNumber "\(\W\&\S\)\@<=\d\+"
hi def link ermVariable Structure
hi def link ermNumber Number

"syn match ermStringCaret "\^"
syn region ermString start="\^" end="\^" contains=ermInterpolation
syn match ermInterpolation "%\([SI]([^);\^]\+)\)\|%[A-Z]\%([f-t\-]\?[0-9]\+\)"
hi def link ermInterpolation Structure
hi def link ermString String

"hi def link ermGetVariable Number
"hi def link ermSetVariable Number
"syn match ermEndNext ";\@<="

"syn match ermComment "(?<=;)"
"syn match ermCommentLine "\(![!#?$]\)\@="
"syn match ermOperator "(![?$][A-Z]{2})"
"syn match ermStringCaret "\^"
"
"syn match ermNumeric "\d+"
"hi def link ermNumeric Numeric
"
"syn match ermConstant "\([^)]+\)"
"
"syn match ermLabel "\[[^\]]+\]"
"hi def link ermLabel Boolean
"syn match ermMacroDeco '@'
"
"syn match ermMacroUsage '\$'
"
"syn match ermComment "$"
"syn match ermTT "(?=![!#?$])"
"
""string caret
"
"hi def link cppOperator		Operator
"hi def link cppStatement		Statement
"hi def link ermReceiver		Type
"hi def link cppType		Type
"hi def link cppStorageClass	StorageClass
"hi def link cppStructure		Structure
"hi def link cppBoolean		Boolean
"hi def link cppConstant		Constant
"hi def link cppRawStringDelimiter	Delimiter
"hi def link cppRawString		String
"hi def link cppNumber		Number
"
let b:current_syntax = "erm"

" vim: ts=8
