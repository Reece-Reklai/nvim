local harpoon
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2', -- Temp; Will be merged soonish 🔥
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      harpoon = require('harpoon'):setup() -- Notice we're storing to parent context 👆
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'add to harpoon list' })
      vim.keymap.set('n', '<C-h>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-q>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(4)
      end)
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'undo tree' })
    end,
  },
  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      local toggleterm = require 'toggleterm'

      toggleterm.setup {
        open_mapping = [[<c-\>]],
        hide_number = true,
        start_in_insert = true,
        direction = 'float', -- vertical | float | tab
        close_on_exit = true,
        shell = vim.o.shell,
        persist_size = true,
        shading_factor = 2,
        shade_terminal = true,
        shade_filetypes = {},
        float_opts = {
          border = 'shadow',
        },
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end,
        },
      }
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end
      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    end,
  },
}
