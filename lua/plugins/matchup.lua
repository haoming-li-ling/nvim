return {
  "andymass/vim-matchup",
  enabled = true,
  event = "BufReadPre",
  init = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
