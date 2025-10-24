local M = {}

local progress = require("fidget.progress")
local handle = nil

function M:init()
	local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", {})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "CodeCompanionRequest*",
		group = group,
		callback = function(request)
			if request.match == "CodeCompanionRequestStarted" then
				local adapter_name = "CodeCompanion"
				local model_name = "Model"
				handle = progress.handle.create({
					title = " Requesting assistance",
					lsp_client = {
						name = string.format("CodeCompanion (%s - %s)", adapter_name, model_name),
					},
				})
			elseif request.match == "CodeCompanionRequestFinished" then
				if handle then
					handle:finish()
				end
			end
		end,
	})
end

return M
