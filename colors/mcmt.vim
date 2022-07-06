" Maintainer: higherkinded <hknd@tuta.io>
" Version:    1.1.0

if &background == 'dark'
    let s:xormask = 0xFF
else
    let s:xormask = 0x00
endif

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name = 'mcmt'

let s:nil = {}

func! s:hi(what, fg, ...)
    let l:exestring = 'hi ' . a:what . ' '

    let l:dohi = 0
    let l:bg = get(a:, 1, s:nil)
    let l:st = get(a:, 2, s:nil)

    if type(a:fg) == type('')
        let l:exestring .= ' guifg=' . a:fg . ' '
        let l:dohi = 1
    endif

    if type(l:bg) == type('')
        let l:exestring .= ' guibg=' . l:bg . ' '
        let l:dohi = 1
    endif

    if type(l:st) == type('')
        let l:exestring .= ' gui='   . l:st . ' '
        let l:exestring .= ' cterm=' . l:st . ' '
        let l:exestring .= ' term='  . l:st . ' '
        let l:dohi = 1
    endif

    if l:dohi
        exe l:exestring
    endif
endf

let s:bold = 'bold'
let s:norm = 'none'
let s:undr = 'underline'

func! s:mkcolor(origin)
    let l:result = '#'
    let l:origin = a:origin

    if l:origin > 255
        let l:origin = 255
    elseif l:origin < 0
        let l:origin = 0
    endif

    let l:br = xor(l:origin, s:xormask) 

    return printf("#%02x%02x%02x", l:br, l:br, l:br)
endf

let s:bg   = s:mkcolor(245)
let s:fg   = s:mkcolor(50)
let s:bfg  = s:mkcolor(80)
let s:fnt  = s:mkcolor(150)
let s:vfnt = s:mkcolor(237)
let s:mfnt = s:mkcolor(220)
let s:str  = s:mkcolor(120)
let s:brt  = s:mkcolor(160)
let s:drk  = s:mkcolor(20)

call s:hi('Normal',               s:fg,   s:bg)
call s:hi('LineNr',               s:fnt,  s:bg)
call s:hi('NonText',              s:bg,   s:nil)
call s:hi('Comment',              s:fnt,  s:nil)
call s:hi('CursorLine',           s:nil,  s:vfnt, s:norm)
call s:hi('CursorColumn',         s:nil,  s:vfnt)
call s:hi('ColorColumn',          s:nil,  s:vfnt)
call s:hi('CursorLineNr',         s:fg,   s:vfnt, s:norm)
call s:hi('Constant',             s:drk)
call s:hi('Number',               s:drk)
call s:hi('Special',              s:brt)
call s:hi('Delimiter',            s:brt)
call s:hi('Exception',            s:drk)
call s:hi('Identifier',           s:brt)
call s:hi('Function',             s:bfg)
call s:hi('Statement',            s:bfg,  s:nil,  s:norm)
call s:hi('Type',                 s:drk,  s:nil,  s:norm)
call s:hi('PreProc',              s:brt)
call s:hi('String',               s:str)
call s:hi('Todo',                 s:drk,  s:bg)
call s:hi('Ignore',               s:fnt,  s:bg)
call s:hi('DiffDelete',           s:drk,  s:bg)
call s:hi('DiffAdd',              s:mfnt, s:bg)
call s:hi('DiffChange',           s:fnt,  s:bg)
call s:hi('DiffText',             s:fg,   s:bg)
call s:hi('Cursor',               s:bg,   s:drk)
call s:hi('Visual',               s:nil,  s:mfnt)
call s:hi('FoldColumn',           s:fg,   s:bg)
call s:hi('SignColumn',           s:fg,   s:bg)
call s:hi('Folded',               s:bg,   s:fnt)
call s:hi('Search',               s:bg,   s:fg)
call s:hi('IncSearch',            s:bg,   s:fg)
call s:hi('ModeMsg',              s:fg,   s:bg)
call s:hi('SpellCap',             s:bg,   s:fnt,  s:norm)
call s:hi('SpellLocal',           s:bg,   s:fnt,  s:norm)
call s:hi('SpellRare',            s:bg,   s:fnt,  s:norm)
call s:hi('WarningMsg',           s:bg,   s:fnt,  s:norm)
call s:hi('ALEWarning',           s:nil,  s:nil,  s:undr)
call s:hi('ALEWarningSign',       s:bg,   s:fnt)
call s:hi('ALEWarningSignLineNr', s:bg,   s:fnt,  s:norm)
call s:hi('ErrorMsg',             s:drk,  s:bg,   s:norm)
call s:hi('Error',                s:drk,  s:bg,   s:norm)
call s:hi('SpellBad',             s:bg,   s:drk,  s:norm)
call s:hi('ALEError',             s:nil,  s:nil,  s:undr)
call s:hi('ALEErrorSign',         s:bg,   s:drk)
call s:hi('ALEErrorSignLineNr',   s:bg,   s:drk,  s:norm)
call s:hi('MatchParen',           s:bg,   s:drk)
call s:hi('SpecialKey',           s:brt)
call s:hi('Title',                s:fnt,  s:nil)
call s:hi('Directory',            s:brt,  s:nil)
call s:hi('Sign',                 s:fnt,  s:nil)
call s:hi('WildMenu',             s:fg,   s:nil)
call s:hi('PmenuSel',             s:bg,   s:drk)
call s:hi('PmenuSbar',            s:fg,   s:fnt)
call s:hi('Pmenu',                s:fg,   s:mfnt)
call s:hi('PmenuThumb',           s:fg,   s:drk)
call s:hi('Tabline',              s:fg,   s:fnt,  s:norm)
call s:hi('TablineFill',          s:bg,   s:fg,   s:norm)
call s:hi('TablineSel',           s:fg,   s:vfnt, s:norm)
call s:hi('VertSplit',            s:fnt,  s:bg,   s:norm)
call s:hi('ModeMsg',              s:fnt,  s:nil,  s:norm)
call s:hi('MoreMsg',              s:fnt,  s:nil,  s:norm)
call s:hi('StatusLine',           s:bg,   s:drk,  s:norm)
call s:hi('StatusLineNC',         s:bfg,  s:mfnt, s:norm)
call s:hi('Whitespace',           s:fnt)
call s:hi('FloatermBorder',       s:drk,  s:bg)
