local mason_jdtls = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jdtls_bin = mason_jdtls .. "/bin/jdtls"

local config = {
	cmd = { jdtls_bin },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
