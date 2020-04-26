"=============================================================================
" What Is This: Add some conceal operator for your haskell files
" File:         haskell.vim (conceal enhancement)
" Author:       Vincent Berthoux <twinside@gmail.com>
" Last Change:  2011-09-07
" Version:      1.3.2
" Require:
"   set nocompatible
"     somewhere on your .vimrc
"
"   Vim 7.3 or Vim compiled with conceal patch.
"   Use --with-features=big or huge in order to compile it in.
"
" Usage:
"   Drop this file in your
"       ~/.vim/after/syntax folder (Linux/MacOSX/BSD...)
"       ~/vimfiles/after/syntax folder (Windows)
"
"   For this script to work, you have to set the encoding
"   to utf-8 :set enc=utf-8
"
"  Changelog:
"   - 1.4.0: fork removed all unwanted conceals (andys8)
"   - 1.3.1: putting undefined in extra conceal, not appearing on windows
"   - 1.3: adding new arrow characters used by GHC in Unicode extension.
"   - 1.2: Fixing conceal level to be local (thx Erlend Hamberg)
"   - 1.1: Better handling of non utf-8 systems, and avoid some
"           concealing operations on windows on some fonts
"
if exists('g:no_haskell_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

" vim: set fenc=utf-8:
syntax match hsNiceOperator "<-" conceal cchar=←
syntax match hsNiceOperator "->" conceal cchar=→
syntax match hsNiceOperator "=>" conceal cchar=⇒

syntax match hsNiceOperator "==" conceal cchar=≡
syntax match hsNiceOperator "\/=" conceal cchar=≠

syntax match hsNiceOperator ">>" conceal cchar=»
syntax match hsNiceOperator "<<" conceal cchar=«

" Match greater than and lower than w/o messing with Kleisli composition
syntax match hsNiceOperator "<=\ze[^<]" conceal cchar=≤
syntax match hsNiceOperator ">=\ze[^>]" conceal cchar=≥

" Redfining to get proper '::' concealing
syntax match hs_DeclareFunction /^[a-z_(]\S*\(\s\|\n\)*::/me=e-2 nextgroup=hsNiceOperator contains=hs_FunctionName,hs_OpFunctionName
syntax match hsNiceOperator "\:\:" conceal cchar=∷

" Only replace the dot, avoid taking spaces around.
syntax match hsNiceOperator /\s\.\s/ms=s+1,me=e-1 conceal cchar=∘

syntax match hsNiceOperator "\.\." conceal cchar=‥
syntax match hsNiceOperator "!!" conceal cchar=‼

hi link hsNiceOperator Operator
hi! link Conceal Operator
