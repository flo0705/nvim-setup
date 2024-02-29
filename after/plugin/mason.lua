local bufferline = require('mason')

bufferline.setup({
	ui = {
		icons = {
			package_installed = "",
            package_pending = "",
            package_uninstalled = "",		
		}
	}
})

require("mason-lspconfig").setup()
