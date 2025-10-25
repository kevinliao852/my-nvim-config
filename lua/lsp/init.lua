return {
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

			require("nvim-navic").setup({
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = " ",
					Interface = " ",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = " ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = " ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason").setup()
					require("mason-lspconfig").setup()
				end,
			},
			{ "williamboman/mason.nvim" },
			-- completion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "saadparwaiz1/cmp_luasnip" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
					"kevinliao852/fastapi-snippet",
				},
				version = "v2.*",
				build = "make install_jsregexp",
			},
			{ "nvimtools/none-ls.nvim" },
			{ "nvimdev/lspsaga.nvim" },
			{ "onsails/lspkind.nvim" },
			-- { "mfussenegger/nvim-jdtls" },
		},

		config = function()
			-- Add additional capabilities supported by nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local lspconfig = vim.lsp
			local navic = require("nvim-navic")

			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
			local servers = { "clangd", "rust_analyzer", "pyright", "ruff", "ts_ls", "gopls", "tailwindcss", "lua_ls" }
			for _, lsp in ipairs(servers) do
				lspconfig.config(lsp, {
					on_attach = on_attach,
					capabilities = capabilities,
					handlers = {
						["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
							-- tailwindcss lang server waits for this repsonse before providing hover
							vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
						end,
					},
				})
				vim.lsp.enable(lsp)
			end

			lspconfig.config("ts_ls", {
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					navic.attach(client, bufnr)
				end,
			})

			lspconfig.config("gopls", {
				capabilities = capabilities,
				settings = {
					lens = {
						enable = true,
						disable = {},
					},

					gopls = {
						codelenses = {
							vulncheck = true, -- "Run govulncheck" code lens on go.mod file.
							generate = true, -- Enable code lens for generating code
							gc_details = true, -- Enable code lens for GC optimization details
						},
						["ui.inlayhint.hints"] = {
							compositeLiteralFields = true,
							constantValues = true,
							parameterNames = true,
							assignVariableTypes = true,
						},
					},
				},
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					client.server_capabilities.codeLensProvider = {
						resolveProvider = false, -- Set to true if you plan to implement lens resolution
					}

					navic.attach(client, bufnr)
				end,
			})

			lspconfig.config("ruff", {
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})

			-- luasnip setup
			local luasnip = require("luasnip")

			-- nvim-cmp setup
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					-- ["<Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item()
					-- 	elseif luasnip.expand_or_jumpable() then
					-- 		luasnip.expand_or_jump()
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
					-- ["<S-Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 		cmp.select_prev_item()
					-- 	elseif luasnip.jumpable(-1) then
					-- 		luasnip.jump(-1)
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "nvim_lsp_signature_help" },
				},
			})

			-- lspkind
			local lspkind = require("lspkind")
			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
					}),
				},
			})

			-- lspsaga

			local lspsaga = require("lspsaga")
			lspsaga.setup({
				symbol_in_winbar = {
					enable = false,
				},
				use_saga_diagnostic_sign = true,
				lightbulb = {
					enable = true,

					sign_priority = 40,
					sign = true,
					virtual_text = false,
					debounce = 1000,
				},
				border_style = "round",
				ui = {
					lspkind = lspkind.presets.default,
					devicon = true,
					code_action = "A",
				},
			})

			-- CodeLens (experimental)
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold" }, {
				pattern = "*.*",
				callback = function()
					vim.lsp.codelens.refresh()
				end,
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader>xy",
				"<cmd>lua vim.lsp.codelens.run()<CR>",
				{ noremap = true, silent = true }
			)

			require("luasnip.loaders.from_vscode").load()
			require("luasnip").filetype_extend("typescript", { "javascript" })

			local venv = vim.fn.getcwd() .. "/.venv/bin/python"
			if vim.fn.executable(venv) == 1 then
				vim.g.python3_host_prog = venv
			end
		end,
	},
}
