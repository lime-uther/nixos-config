return {
  {
    'sainnhe/gruvbox-material',
    name = 'gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'default'
      vim.g.gruvbox_material_enable_bold = '1'
      vim.g.gruvbox_material_enable_italics = '1'

      vim.cmd.colorscheme('gruvbox-material')

      -- vim.api.nvim_set_hl(0, "Normal",       { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "StatusLine",   { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", ctermbg = "none" })
      --
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "TelescopePromptBorder" })
      vim.api.nvim_set_hl(0, "FloatTitle",  { link = "TelescopePromptNormal" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require('gitsigns').setup({ signcolumn = false })
    end
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },
  {
    'vyfor/cord.nvim',
    config = function ()
      require('cord').setup {
        buttons = {
          { label = 'View Repository', url = function(opts) return opts.repo_url end },
        },
      }
    end
  }
}

