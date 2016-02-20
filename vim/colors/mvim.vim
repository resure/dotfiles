" MacVim colorscheme
"
" Maintainer:   Bjorn Winckler <bjorn.winckler@gmail.com>
" Last Change:  2008 May 9
"
" This is the default MacVim color scheme.  It supports both light and dark
" backgrounds (see :h 'background').
"


highlight clear

" Reset String -> Constant links etc if they were reset
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mvim"


"
" First list all groups common to both 'light' and 'dark' background.
"

" `:he highlight-groups`
hi DiffAdd      guibg=#3cb371
hi Directory    guifg=#1600FF
hi ErrorMsg     guibg=#ee2c2c guifg=#ffffff
hi FoldColumn   guibg=#bebebe guifg=#af87af
hi Folded       guibg=#E6E6E6 guifg=#af87af
hi IncSearch    gui=reverse
hi ModeMsg      gui=bold
hi MoreMsg      gui=bold guifg=#2e8b57
hi NonText      gui=bold guifg=#eeeeee
hi Pmenu        guibg=#cae1ff
hi PmenuSbar    guibg=#bebebe
hi PmenuSel     guifg=#ffffff guibg=#4a708b
hi PmenuThumb   gui=reverse
hi Question     gui=bold guifg=#458b00
hi SignColumn   guibg=#bebebe guifg=#af87af
hi SpecialKey   guifg=#eeeeee
hi SpellBad     guisp=#ee2c2c gui=undercurl
hi SpellCap     guisp=#eeeeee gui=undercurl
hi SpellLocal   guisp=#008b8b gui=undercurl
hi SpellRare    guisp=#ff00ff gui=undercurl
hi StatusLine   gui=NONE guifg=#ffffff guibg=#2f4f4f
hi StatusLineNC gui=NONE guifg=#778899 guibg=#e5e5e5
hi TabLine      gui=underline guibg=#d3d3d3
hi TabLineFill  gui=reverse
hi TabLineSel   gui=bold
hi Title        gui=bold guifg=#009acd
hi VertSplit    gui=NONE guifg=#2f4f4f guibg=#e5e5e5
hi Visual       guibg=#eddecb
hi WarningMsg   guifg=#ee2c2c

" Syntax items (`:he group-name` -- more groups are available, these are just
" the top level syntax items for now).
hi Error        gui=NONE guifg=#ffffff guibg=#cd2626
hi Identifier   gui=NONE guifg=#458b74 guibg=NONE
hi Ignore       gui=NONE guifg=bg guibg=NONE
hi PreProc      gui=NONE guifg=#1874cd guibg=NONE
hi Special      gui=NONE guifg=#8a2be2 guibg=NONE
hi String       gui=NONE guifg=#4a708b guibg=NONE
hi Underlined   gui=underline guifg=#63b8ff


"
" Groups that differ between 'light' and 'dark' background.
"

if &background == "dark"
  hi Boolean      gui=NONE guifg=#8b0a50 guibg=NONE
  hi Comment      gui=italic guifg=#7ac5cd
  hi Constant     gui=NONE guifg=#ffc125 guibg=NONE
  hi Cursor       guibg=#eedd82 guifg=bg
  hi CursorColumn guibg=#333333
  hi CursorIM     guibg=#bebebe guifg=bg
  hi CursorLine   guibg=#333333
  hi DiffChange   guibg=#5d478b
  hi DiffDelete   gui=bold guifg=#ffffff guibg=#6a5acd
  hi DiffText     gui=NONE guifg=#ffffff guibg=#4682b4
  hi LineNr       guifg=#552A7B guibg=#bebebe
  hi MatchParen   guifg=#ffffff guibg=#ff00ff
  hi Normal       guifg=#bebebe guibg=#bebebe
  hi Search       guibg=#42A5F5 guifg=NONE
  hi Statement    gui=bold guifg=#9b30ff guibg=NONE
  hi Todo         gui=NONE guifg=#008b00 guibg=#00bfff
  hi Type         gui=bold guifg=#008b8b guibg=NONE
  hi WildMenu     guibg=#87ceeb guifg=#ffffff
  hi lCursor      guibg=#bebebe guifg=bg
else
  hi Boolean      gui=NONE guifg=#cd0000 guibg=NONE
  hi Comment      gui=italic guifg=#444444 guibg=NONE
  hi Constant     gui=NONE guifg=#ff8c00 guibg=NONE
  hi Cursor       guibg=fg guifg=bg
  hi CursorColumn guibg=#F1F5FA
  hi CursorIM     guibg=fg guifg=bg
  hi CursorLine   guibg=#F1F5FA
  hi DiffChange   guibg=#00bfff
  hi DiffDelete   gui=bold guifg=#000000 guibg=#6a5acd
  hi DiffText     gui=NONE guibg=#ffd700
  hi LineNr       guifg=#888888 guibg=#EEEEEE
  hi MatchParen   guifg=#ffffff guibg=#ab82ff
  hi Normal       gui=NONE guifg=#000000 guibg=#ffffff
  hi Search       guibg=#90CAF9 guifg=NONE
  hi Statement    gui=bold guifg=#b51a02 guibg=NONE
  hi Todo         gui=NONE guifg=#006400 guibg=#A5D6A7
  hi Type         gui=bold guifg=#008b00 guibg=NONE
  hi WildMenu     guibg=#87ceeb guifg=#000000
  hi lCursor      guibg=fg guifg=bg
endif


"
" Change the selection color on focus change (but only if the "macvim"
" colorscheme is active).
"
if has("gui_macvim") && !exists("s:augroups_defined")
  au FocusLost * if exists("colors_name") && colors_name == "macvim" | hi Visual guibg=MacSecondarySelectedControlColor | endif
  au FocusGained * if exists("colors_name") && colors_name == "macvim" | hi Visual guibg=MacSelectedTextBackgroundColor | endif

  let s:augroups_defined = 1
endif

" vim: sw=2
