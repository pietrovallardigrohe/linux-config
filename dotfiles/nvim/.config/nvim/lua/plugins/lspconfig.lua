return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
      ui = {
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
          }
      }
    }
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "lua_ls",
        "powershell_es",
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts={} },
      "neovim/nvim-lspconfig",
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('powershell_es')
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "prettier",
      }
    }
  }
}
