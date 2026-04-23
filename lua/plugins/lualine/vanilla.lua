return {
  options = {
    icons_enabled = true,
    -- theme = "gruvbox_dark",
    -- theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {} },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000 } },
  sections = {
    lualine_a = {
      {
        "mode",
        -- fmt = function(str)
        -- 	return str:sub(1, 3)
        -- end,
      },
    },
    lualine_b = {
      -- "branch",
      -- "diff",
      "diagnostics" },
    lualine_c = {
      "filename",
      function()
        return "%="
      end,
      {
        -- Lsp server name .
        function()
          -- local msg = "No Active LSP"
          local msg = "∅"
          local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              if client.name ~= "efm" and client.name ~= "null-ls" and client.name ~= "emmet_ls" then
                return client.name
              end
            end
          end
          return msg
        end,
        icon = "",
        -- icon = "",
        -- icon = ' LSP:',
        color = { fg = "#ffffff", gui = "bold" } } },
    lualine_x = {
      "encoding",
      "fileformat",
      { "filetype", icons_enabled = false } },
    lualine_y = {
      function()
        return require("recorder").recordingStatus()
      end,
      function()
        return require("recorder").displaySlots()
      end },
    lualine_z = {
      {
        "location",
        fmt = function(str)
          return string.format("%7s", str)
        end } } },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {} },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "neo-tree", "aerial", "symbols-outline", "quickfix" } }
