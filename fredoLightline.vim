" =============================================================================
" Filename: autoload/lightline/colorscheme/fredo.vim
" Author: Fredo
" License: MIT License
" Last Change: 2019/10/04
" =============================================================================
let s:base03 = [ '#151513', 233 ]
let s:base02 = [ '#212121 ', 236 ]
let s:base01 = [ '#303030', 239 ]
let s:base00 = [ '#666656', 242  ]
let s:base0 = [ '#808070', 244 ]
let s:base1 = [ '#949484', 246 ]
let s:base2 = [ '#a8a897', 248 ]
let s:base3 = [ '#e8e8d3', 253 ]
let s:yellow = [ '#fbb829', 3 ]
let s:orange = [ '#d75f00', 166 ]
let s:red = [ '#FF5370', 1 ]
let s:magenta = [ '#e02c6d', 5 ]
let s:peach = [ '#C792EA', 181 ]
let s:blue = [ '#5573a3', 4 ]
let s:bright_blue = [ '#8eb2f7', 12 ]
let s:cyan = [ '#0aaeb3', 6 ]
let s:green = [ '#C3E88D', 2 ]
let s:bright_green = [ '#C3E88D', 10 ]
let s:white = [ '#B2CCD6', 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:bright_blue, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:bright_green, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base02, s:red, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:peach, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base0, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00, 'bold'] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:base02 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

let g:lightline#colorscheme#fredoLightline#palette = lightline#colorscheme#flatten(s:p)
