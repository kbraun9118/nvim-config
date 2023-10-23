local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

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
opt.clipboard:append("unnamedplus") -- use system clipboard

-- splitting
opt.splitright = true
opt.splitbelow = true

-- swap and undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.showmode = false
