local status_ok, lspsaga = pcall(require, "lspsaga")

if not status_ok then
	return
end

lspsaga.setup({
	use_saga_diagnostic_sign = true,
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "   ",
	code_action_icon = " ",
	border_style = "round",
})
