local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "briones-gabriel/darcula-solid.nvim", dependencies = { "rktjmp/lush.nvim" },                        priority = 1000 },
  { "navarasu/onedark.nvim",              priority = 1000 },
  { "nvim-lualine/lualine.nvim",          dependencies = { "nvim-tree/nvim-web-devicons", lazy = true } },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
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
  -- { "numToStr/Comment.nvim",   opts = {},     lazy = false },
  "tpope/vim-surround",
  "lewis6991/gitsigns.nvim",
  "christoomey/vim-tmux-navigator",
  "ThePrimeagen/vim-be-good",
  "windwp/nvim-autopairs",
  "RRethy/vim-illuminate",
  "kdheepak/lazygit.nvim",

  { "akinsho/toggleterm.nvim", version = "*", config = true },

  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require("fidget").setup({})`
      { "j-hui/fidget.nvim",       tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        -- refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = false,      -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",
      height = 20,
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
  },

  -- TODO check out these plugins after LSP is configured
  -- "tpope/vim-rhubarb",
  -- "tpope/vim-sleuth",
  -- "mbbill/undotree",  -- already mentioned up top!
  -- { "folke/which-key.nvim", opts = {} },
  -- { "numToStr/Comment.nvim", opts = {} },  -- "gc" to comment visual regions/lines
  -- "RRethy/vim-illuminate",
  -- {
  --   -- Add indentation guides even on blank lines
  --   "lukas-reineke/indent-blankline.nvim",
  --   -- Enable `lukas-reineke/indent-blankline.nvim`
  --   -- See `:help indent_blankline.txt`
  --   opts = {
  --     char = "┊",
  --     show_trailing_blankline_indent = false,
  --   },
  -- },
})
