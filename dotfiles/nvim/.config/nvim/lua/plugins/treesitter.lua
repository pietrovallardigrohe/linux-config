return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({ 'json' })

    vim.api.nvim_create_autocmd('FileType', {

      -- Enable Highlighting
      pattern = { 'lua', 'javascript', 'typescript', 'json' },
      callback = function() 
        vim.treesitter.start() 
      
        -- Enable Folds
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'

        -- Enable Indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
