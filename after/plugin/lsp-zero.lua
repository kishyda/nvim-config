local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "eslint", "pyright", "jdtls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})
local lspconfig = require("lspconfig")

-- Add this to your existing lsp-zero configuration
local servers = {
	jdtls = {},
}

-- If you want to avoid duplicate servers, you can check if the server is already installed
local setup = {
	jdtls = function()
		return not vim.tbl_contains(vim.lsp.get_installed_servers(), "jdtls")
	end,
}

-- Merge the options with the existing lsp-zero configuration
local opts = {
	servers = servers,
	setup = setup,
}

-- Merge opts into your lsp-zero configuration
local lsp_zero_config = {
	-- Your existing lsp-zero configurations...
}
opts = {
	-- make sure mason installs the server
	servers = {
		jdtls = {},
	},
	setup = {
		jdtls = function()
			return true -- avoid duplicate servers
		end,
	},
}

-- Merge opts into the lsp-zero config
for k, v in pairs(opts) do
	lsp_zero_config[k] = v
end

-- Now, lsp_zero_config contains your complete configuration for lsp-zero

-- Export the configuration
return lsp_zero_config
