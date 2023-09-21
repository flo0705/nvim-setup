local builtin = require('telescope.builtin')

vim.g.mapleader = " "

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope file_browser path=%:p:h select_buffe=true<cr>')

vim.keymap.set('n', '<leader>sG',
	function()
		builtin.live_grep { additional_args = function(args)
			return vim.list_extend(args,
				{ '--hidden', '--no-ignore' })
		end }
	end, { desc = 'Find Grep Everything' })

