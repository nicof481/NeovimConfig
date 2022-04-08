
local opt = vim.opt
opt.termguicolors = true
vim.g.onedark_terminal_italics = 2
opt.background = 'dark'
vim.cmd ([[
    colorscheme gruvbox
    ab h tab help
    syntax on
]])
-- highlight cursor's row
opt.cursorline = true
-- dont save on buff switch
opt.hidden = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.expandtab = true
opt.scroll = 5
opt.swapfile = false
opt.ignorecase = true
--turn off highlight after search
opt.hlsearch = false
-- highlight on yank
vim.api.nvim_exec(
    [[
	augroup YankHighlight
	    au!
	    au TextYankPost * silent! lua vim.highlight.on_yank()
	augroup END
    ]],
    false
)
opt.breakindent = true --dont index wrapped lines
--save undo history
opt.undofile = true


