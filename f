[1mdiff --git a/lua/custom/plugins/init.lua b/lua/custom/plugins/init.lua[m
[1mindex 705e9d5..8721ce0 100644[m
[1m--- a/lua/custom/plugins/init.lua[m
[1m+++ b/lua/custom/plugins/init.lua[m
[36m@@ -93,9 +93,43 @@[m [mreturn {[m
     end,[m
   },[m
   {[m
[31m-    'adigitoleo/haunt.nvim',[m
[32m+[m[32m    'akinsho/nvim-toggleterm.lua',[m
     config = function()[m
[31m-      require('haunt').setup { define_commands = false }[m
[32m+[m[32m      local toggleterm = require 'toggleterm'[m
[32m+[m
[32m+[m[32m      toggleterm.setup {[m
[32m+[m[32m        open_mapping = [[<c-\>]],[m
[32m+[m[32m        hide_number = true,[m
[32m+[m[32m        start_in_insert = true,[m
[32m+[m[32m        direction = 'float', -- vertical | float | tab[m
[32m+[m[32m        close_on_exit = true,[m
[32m+[m[32m        shell = vim.o.shell,[m
[32m+[m[32m        persist_size = true,[m
[32m+[m[32m        shading_factor = 2,[m
[32m+[m[32m        shade_terminal = true,[m
[32m+[m[32m        shade_filetypes = {},[m
[32m+[m[32m        float_opts = {[m
[32m+[m[32m          border = 'shadow',[m
[32m+[m[32m        },[m
[32m+[m[32m        winbar = {[m
[32m+[m[32m          enabled = false,[m
[32m+[m[32m          name_formatter = function(term) --  term: Terminal[m
[32m+[m[32m            return term.name[m
[32m+[m[32m          end,[m
[32m+[m[32m        },[m
[32m+[m[32m      }[m
[32m+[m[32m      function _G.set_terminal_keymaps()[m
[32m+[m[32m        local opts = { buffer = 0 }[m
[32m+[m[32m        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)[m
[32m+[m[32m        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)[m
[32m+[m[32m        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)[m
[32m+[m[32m        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)[m
[32m+[m[32m        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)[m
[32m+[m[32m        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)[m
[32m+[m[32m        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)[m
[32m+[m[32m      end[m
[32m+[m[32m      -- if you only want these mappings for toggle term use term://*toggleterm#* instead[m
[32m+[m[32m      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'[m
     end,[m
   },[m
 }[m
