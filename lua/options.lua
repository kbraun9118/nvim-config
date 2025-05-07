local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- enable mouse mode
opt.mouse = 'a'

-- ui niceness
opt.signcolumn = "yes"
opt.background = "dark"
opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start"

-- tab behavior
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- clipboard
opt.clipboard = "unnamedplus" -- use system clipboard

-- splitting
opt.splitright = true
opt.splitbelow = true

-- swap and undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- duplicate of lualine
opt.showmode = false

-- always show 8 lines above or below
opt.scrolloff = 8

-- add column at 120 characrs
opt.colorcolumn = "120"

-- default to linux file format
opt.fileformat = "unix"

-- confirm file saving
opt.confirm = true
