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
      end)
      vim.keymap.set('n', '<C-m>', function()
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
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
        icons = false,
      }

      vim.keymap.set('n', '<leader>tt', function()
        require('trouble').toggle()
      end)

      vim.keymap.set('n', '(t', function()
        require('trouble').next { skip_groups = true, jump = true }
      end)

      vim.keymap.set('n', ')t', function()
        require('trouble').previous { skip_groups = true, jump = true }
      end)
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>git', vim.cmd.Git)

      local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup('ThePrimeagen_Fugitive', {})

      local autocmd = vim.api.nvim_create_autocmd
      autocmd('BufWinEnter', {
        group = ThePrimeagen_Fugitive,
        pattern = '*',
        callback = function()
          if vim.bo.ft ~= 'fugitive' then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set('n', '<leader>gph', function()
            vim.cmd.Git 'push'
          end, opts)

          -- rebase always
          vim.keymap.set('n', '<leader>gpl', function()
            vim.cmd.Git { 'pull', '--rebase' }
          end, opts)

          -- NOTE: It allows me to easily set the branch i am pushing and any tracking
          -- needed if i did not set the branch up correctly
          vim.keymap.set('n', '<leader>gpo', ':Git push -u origin ', opts)
        end,
      })

      vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>')
      vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>')
    end,
  },
  {
    'adigitoleo/haunt.nvim',
    config = function()
      require('haunt').setup { define_commands = false }
    end,
  },
}
