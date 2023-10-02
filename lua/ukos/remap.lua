vim.g.mapleader = " "
vim.keymap.set("n", "Q", "<nop>")

-- quick escape from INSERT mode
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>ve", "<cmd>vsplit $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>vev", "<cmd>vsplit ~/.vimrc<CR>")

-- this was replaced by <C-L> in nvim 0.6.0 but "vim-tmux-navigator" plugin already occupies <C-L>
vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- keep my buffer centered when navigating vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move lines in VISUAL mode with "J" & "K"
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- more convenient horizontal navigation
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- fzf remaps
-- vim.keymap.set("n", "<C-F>", "<cmd>Rg<CR>")  -- telescope got this
-- vim.keymap.set("n", "<C-N>", "<cmd>GFiles<CR>")  -- telescope got this
vim.keymap.set("n", "<leader>gc", "<cmd>GFiles?<CR>")
vim.keymap.set("n", "<leader>af", "<cmd>Files<CR>")
-- vim.keymap.set("n", "<leader>a", "<cmd>Buffers<CR>")  -- telescope got this
-- vim.keymap.set("n", "<leader>A", "<cmd>Windows<CR>")  -- conflicts with treesitter's swap_prev
vim.keymap.set("n", "<leader>;", "<cmd>BLines<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>BTags<CR>")
vim.keymap.set("n", "<leader>O", "<cmd>Tags<CR>")
-- vim.keymap.set("n", "<leader>?", "<cmd>History<CR>")  -- telescope got this
vim.keymap.set("n", "<leader>gl", "<cmd>Commits<CR>")
vim.keymap.set("n", "<leader>ga", "<cmd>BCommits<CR>")
vim.keymap.set("n", "<leader>ft", "<cmd>Filetypes<CR>")

-- remaps for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- very useful remaps for clipboard management
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- replace the word under cursor in the scope of the current buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- try those out once LSP is fully functional ("quick-fix list navigation")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- goto-preview plugin remaps
vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
vim.keymap.set("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })

-- other remaps
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>")
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>")
vim.keymap.set("n", "<leader>rs", "<cmd>source Session.vim<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-_>", "<cmd>Commentary<CR>")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
vim.keymap.set("n", "<leader>6", "<cmd>TodoTrouble<CR>")
