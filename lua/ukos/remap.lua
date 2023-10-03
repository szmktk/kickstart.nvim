local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "Q", "<nop>")

-- quick escape from INSERT mode
map("i", "jk", "<ESC>")

map("n", "<leader>ve", "<cmd>vsplit $MYVIMRC<CR>")
map("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>")
map("n", "<leader>vev", "<cmd>vsplit ~/.vimrc<CR>")

-- this was replaced by <C-L> in nvim 0.6.0 but "vim-tmux-navigator" plugin already occupies <C-L>
map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- keep my buffer centered when navigating vertically
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- move lines in VISUAL mode with "J" & "K"
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- more convenient horizontal navigation
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")

-- fzf remaps
-- map("n", "<C-F>", "<cmd>Rg<CR>")  -- telescope got this
-- map("n", "<C-N>", "<cmd>GFiles<CR>")  -- telescope got this
map("n", "<leader>gc", "<cmd>GFiles?<CR>")
map("n", "<leader>af", "<cmd>Files<CR>")
-- map("n", "<leader>a", "<cmd>Buffers<CR>")  -- telescope got this
-- map("n", "<leader>A", "<cmd>Windows<CR>")  -- conflicts with treesitter's swap_prev
map("n", "<leader>;", "<cmd>BLines<CR>")
map("n", "<leader>o", "<cmd>BTags<CR>")
map("n", "<leader>O", "<cmd>Tags<CR>")
-- map("n", "<leader>?", "<cmd>History<CR>")  -- telescope got this
map("n", "<leader>gl", "<cmd>Commits<CR>")
map("n", "<leader>ga", "<cmd>BCommits<CR>")
map("n", "<leader>ft", "<cmd>Filetypes<CR>")

-- remaps for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- very useful remaps for clipboard management
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- replace the word under cursor in the scope of the current buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- try those out once LSP is fully functional ("quick-fix list navigation")
-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- goto-preview plugin remaps
map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
map("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
map("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })
map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })

-- cellular-automaton remaps
map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>fml", "<cmd>CellularAutomaton scramble<CR>")

-- other remaps
map("n", "<leader>lg", "<cmd>LazyGit<CR>")
map("n", "<leader>tw", "<cmd>set wrap!<CR>")
map("n", "<leader>rs", "<cmd>source Session.vim<CR>")
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<C-_>", "<cmd>Commentary<CR>")
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
map("n", "<leader>6", "<cmd>TodoTrouble<CR>")
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
