local scheme = {
  onedark = function()
    return require("onedark.palette").dark
  end,
  gruvbox = function()
    return require("gruvbox.palette")
  end,
  gruvbox_baby = function()
    return require("gruvbox.palette")
  end,
  tundra = function()
    return require("nvim-tundra.palette.arctic")
  end,
  material = function()
    return require("material.colors")
  end,
  catppuccin = function()
    return require("catppuccin.palettes").get_palette()
  end,
  monokai = function()
    return require("monokai").pro
  end,
}

local make = {}
function make.onedark(tp)
  return {
    bg = tp.bg_d,
    fg = tp.fg,
    yellow = tp.yellow,
    cyan = tp.cyan,
    darkblue = tp.dark_cyan,
    green = tp.green,
    orange = tp.orange,
    violet = tp.dark_purple,
    magenta = tp.purple,
    blue = tp.blue,
    red = tp.red,
  }
end

function make.gruvbox(tp)
  return {
    bg = tp.dark0,
    fg = tp.light1,
    yellow = tp.neutral_yellow,
    cyan = tp.neutral_aqua,
    darkblue = tp.neutral_blue,
    green = tp.neutral_green,
    orange = tp.neutral_orange,
    violet = tp.neutral_purple,
    magenta = tp.bright_purple,
    blue = tp.bright_blue,
    red = tp.neutral_red,
  }
end

function make.monokai(tp)
  return {
    bg = tp.base0,
    fg = tp.base8,
    yellow = tp.yellow,
    cyan = tp.aqua,
    darkblue = tp.aqua,
    green = tp.green,
    orange = tp.orange,
    violet = tp.purple,
    magenta = tp.pink,
    blue = tp.aqua,
    red = tp.red,
  }
end

function make.material(tp)
  return {
    bg = tp.bg,
    fg = tp.fg,
    yellow = tp.yellow,
    cyan = tp.cyan,
    darkblue = tp.darkblue,
    green = tp.green,
    orange = tp.orange,
    violet = tp.purple,
    magenta = tp.pink,
    blue = tp.blue,
    red = tp.red,
  }
end

function make.tundra(tp)
  return {
    bg = tp.gray._800,
    fg = tp.gray._200,
    yellow = tp.green._600,
    cyan = tp.indigo._400,
    darkblue = tp.indigo._800,
    green = tp.green._500,
    orange = tp.orange._500,
    violet = tp.indigo_500,
    magenta = tp.red._500,
    blue = tp.sky._500,
    red = tp.red._600,
  }
end

function make.catppuccin(tp)
  return {
    bg = tp.base,
    fg = tp.text,
    yellow = tp.rosewater,
    cyan = tp.sky,
    darkblue = tp.blue,
    green = tp.green,
    orange = tp.peach,
    violet = tp.mauve,
    magenta = tp.maroon,
    blue = tp.sapphire,
    red = tp.red,
  }
end

setmetatable(make, {
  __index = function()
    return make.catppuccin
  end,
})

setmetatable(scheme, {
  __index = function()
    return scheme.catppuccin
  end,
})

local colors = make[vim.g.theme](scheme[vim.g.theme]())

local conditions = {
  -- buffer_not_empty = function()
  --   return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  -- end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local M = {
  options = {
    refresh = {
      statusline = 1000,
    },
    -- Disable sections and component separators
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {
        c = { fg = colors.fg, bg = colors.bg },
        a = { fg = colors.fg, bg = colors.bg },
      },
      inactive = {
        c = { fg = colors.fg, bg = colors.bg },
        a = { fg = colors.fg, bg = colors.bg },
      },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  extensions = { "nvim-tree" },
}

local function ins_leftmost(component)
  table.insert(M.sections.lualine_a, component)
end

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  -- table.insert(config.sections.lualine_c, component)
  table.insert(M.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(M.sections.lualine_x, component)
end

ins_leftmost({
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_leftmost({
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
    return ""
  end,
  color = "LualineMode",
  padding = { right = 1 },
})

ins_leftmost({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
})
ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
  function()
    return "%="
  end,
})

ins_left({
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = "",
  -- icon = ' LSP:',
  color = { fg = "#ffffff", gui = "bold" },
})

-- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- }

ins_right({
  "encoding", -- option component same as &encoding in viml
  -- fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "fileformat",
  -- fmt = string.upper,
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
})

ins_right({
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
})

return M
