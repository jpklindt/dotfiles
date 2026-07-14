vim.g.netrw_liststyle = 3 -- (vim.cmd wrapper not needed for g: vars)

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

-- search
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

-- clipboard (was in init.lua)
opt.clipboard = "unnamedplus"

-- splits
opt.splitright = true
opt.splitbelow = true

opt.undofile = true -- persistent undo across sessions
opt.scrolloff = 8 -- context above/below cursor (you use 12 in VS Code)
opt.updatetime = 250 -- faster gitsigns/diagnostics refresh
opt.confirm = true -- ask instead of failing on :q with changes
opt.sidescrolloff = 8
opt.pumheight = 10
opt.virtualedit = "block"
