return {
  -- on_attach = function(client, bufnr)
  -- 	-- my_util.on_attach(client, bufnr)
  -- 	my_util.disable_formatting(client)
  -- end,
  -- capabilities = my_util.capabilities,
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      diagnostics = {
        globals = {
          "vim",
          "use",
          "Snacks",
          "spoon",
          "use_rocks",
        },
      },
    },
  },
}
