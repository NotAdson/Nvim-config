local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = function(fallback)
			if require('copilot.suggestion').is_visible() then
				require('copilot.suggestion').accept()
		      	else
				fallback()
		      	end
		end,
	}),
	sources = cmp.config.sources({
		{name = "copilot"},
		{ name = "nvim_lsp" },
		{ name = "luasnip" }
	}),
})

