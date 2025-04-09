-- make sure to export the JDTLS_HOME variable
-- such that the `jdtls` command is under $JDTLS_HOME/bin
local jdtls_home = os.getenv("JDTLS_HOME")
local jdtls_path = jdtls_home .. "/bin/jdtls"

local config = {
	cmd = { jdtls_path },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
