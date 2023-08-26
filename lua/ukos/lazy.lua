local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  { "briones-gabriel/darcula-solid.nvim", dependencies = { "rktjmp/lush.nvim" }, priority=1000 },
  { "navarasu/onedark.nvim", priority=1000 },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons", lazy = true } },

  {
    'nvim-treesitter/nvim-treesitter',
    -- dependencies = {
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    -- },
    build = ':TSUpdate',
  },
  "nvim-treesitter/playground",
  -- "theprimeagen/harpoon",
  -- "mbbill/undotree",
  "mhinz/vim-startify",
  "airblade/vim-rooter",
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf", build = ":call fzf#install()" }
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  "wakatime/vim-wakatime",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "lewis6991/gitsigns.nvim",
  "christoomey/vim-tmux-navigator",
  "ThePrimeagen/vim-be-good",
  "windwp/nvim-autopairs",
  "kdheepak/lazygit.nvim",

  { "akinsho/toggleterm.nvim", version = "*", config = true }

})
