" Vim syntax file
" Language:	ERM
" Maintainer:	KIM Hyeok <ekh0324@gmail.com>
" Last Change:	2020-04-27

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match ermBeginKeyword "\%^ZVSE"
"hi def link ermBeginKeyword		Exception
syntax region ermComment start="\[" end="\]" 
hi def link ermComment Comment
hi ermBeginKeyword  ctermbg=White ctermfg=DarkBlue 
syn match ermCommentBegin "\(^\s*\|;\s*\)\zs[^!]\+$" contains=ermComment
syn match ermCommentLine "^\s*[^!].*" contains=ermBeginKeyword,ermComment
hi ermComment cterm=bold 
hi def link ermCommentBegin Comment
hi def link ermCommentLine Comment


syn match ermReceiver "\(^\s*\|;\s*\)\zs\(!!\)\([A-Za-z]\{2}\)\ze" contains=ermFunctionCall
syn match ermFunctionCall "\(^\s*\|;\s*\)!!\zsFU\(\(\(\d\+\)\|\(([^)]\+)\)\)\)\ze"
syn match ermIF "^\s*![#!]SN\zs\([&|].\{-0,}\)\ze:"
syn match ermIF1 "^\s*!!\zsif\([&|].\{-0,}\)\ze:" contains=ermIFcontain 
syn match ermReceiverHero "^\s*\(![#!]HE\)\(-1\|\d\{1,3}\|[xyvzwefc]\%(-\?\d\+\)\)"
syn match ermIFcontain "\(^\s*\|;\s*\)\(![#!]\([A-Za-z]\{2}\)\)\zs\([&|][^:]\+\)\ze:" contains=ermVariable,ermNumber
"syn cluster ermIF contains=ermReceiverIF,ermReceiverIF
hi def link ermReceiver   Function 
hi def link ermFunctionCall Special
hi def link ermIF   Conditional 
hi def link ermIF1  Conditional
hi def link ermIFcontain Conditional
hi def link ermReceiverHero Function



syn match ermInstruction "\(^\s*\|;\s*\)\zs\(!#\)\([A-Za-z]\{2}\)\ze"
hi def link ermInstruction  Function
syn match ermFunctionDefinition "^\s*\(!?FU\)\(\(\(\d\+\)\|\(([^)]\+)\)\)\)"
hi def link ermFunctionDefinition Define

syn match ermTrigger "^\s*\(![?$]\(FU\)\@![A-Z]\{2}\)"
hi def link ermTrigger Define







syn match ermVariable "\([g-t]\|[xyvzwefc]\)\%(-\?\d\+\)"
syn match ermNumber "\(\W\&\S\)\@<=\d\+"
hi def link ermVariable Structure
hi def link ermNumber Number

"syn match ermStringCaret "\^"
syn region ermString start="\^" end="\^" contains=ermInterpolation
syn match ermInterpolation "%\([SI]([^);\^]\+)\)\|%[A-Z]\%([f-t\-]\?[0-9]\+\)"
hi def link ermInterpolation Structure
hi def link ermString String

let b:current_syntax = "erm"

" vim: ts=8
