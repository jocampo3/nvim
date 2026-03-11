return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      opts = {
        log_level = "DEBUG",
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup({
        rules = {
          default = {
            files = {
              "AGENT.md",
            },
          },
        },
        adapters = {
          http = {
            openai = function()
              return require("codecompanion.adapters").extend("openai", {
                env = {
                  api_key = "",
                },
              })
            end,
          },
        },

        strategies = {
          chat = {
            adapter = "openai",
            model = "gpt-4.1-mini",
          },
          inline = {
            adapter = "openai",
            model = "gpt-4.1-mini",
          },
        },

        opts = {
          log_level = "DEBUG",
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "svelte",
          "php",
          "htmldjango",
          "astro",
        },
      })
    end,
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "tpope/vim-fugitive" },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>A",
        function()
          require("harpoon"):list():append()
        end,
        desc = "harpoon file",
      },
      {
        "<tab>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
  { "nvim-treesitter/nvim-treesitter" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "astro",
        "javascript",
        "typescript",
        "php",
        "svelte",
      },
    },
  },
}
