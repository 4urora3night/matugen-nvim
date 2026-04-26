if exists('g:loaded_matugen_nvim') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

let g:loaded_matugen_nvim = 1

let &cpo = s:save_cpo
unlet s:save_cpo
