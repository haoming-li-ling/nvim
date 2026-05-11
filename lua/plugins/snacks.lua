vim.pack.add({
  "https://github.com/krissen/snacks-bibtex.nvim",
  "https://github.com/folke/snacks.nvim",
})

require("snacks-bibtex").setup({
  mappings = {
    ["<C-p>"] = false,
  },
  context = {
    enabled = true,
    fallback = true,
  },
  display = {
    show_key = false,
  },
  global_files = {
    "~/Documents/MIT/Distributivity.bib",
    "~/Documents/MIT/Anti-locality.bib",
  },
})

vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

vim.keymap.set("i", "<C-b><C-b>", function()
  require("snacks-bibtex").bibtex()
end, { desc = "citation key" })

vim.keymap.set("i", "<C-b><C-t>", function()
  require("snacks-bibtex").bibtex({ mappings = { ["<CR>"] = { kind = "citation_command", id = "\\citet" } } })
end, { desc = "text cite" })

vim.keymap.set("i", "<C-b><C-p>", function()
  require("snacks-bibtex").bibtex({ mappings = { ["<CR>"] = { kind = "citation_command", id = "\\citep" } } })
end, { desc = "paren cite" })

_G.dd = function(...)
  Snacks.debug.inspect(...)
end

_G.bt = function()
  Snacks.debug.backtrace()
end

vim.print = _G.dd -- Override print to use snacks for `:=` command

-- Create some toggle mappings
Snacks.toggle
  .new({
    name = "latex_symbol",
    get = function()
      return vim.b.latex_symbol
    end,
    set = function(state)
      vim.b.latex_symbol = state and true or false
    end,
  })
  :map("<leader>mts")
Snacks.toggle.option("wrap", { name = "wrap" }):map("<leader>tw")
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
Snacks.toggle.option("expandtab"):map("<leader>t<tab>")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tr")
Snacks.toggle.diagnostics():map("<leader>td")
Snacks.toggle.line_number():map("<leader>tl")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  :map("<leader>tc")
Snacks.toggle.treesitter():map("<leader>tT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
Snacks.toggle.inlay_hints():map("<leader>th")
Snacks.toggle.indent():map("<leader>ti")
Snacks.toggle.dim():map("<leader>tD")
Snacks.toggle
  .option("keymap", { on = "vietnamese-telex_utf-8", off = "", name = "Vietnamese keymap" })
  :map("<M-v>", { mode = { "n", "x", "i" } })
  :map("<leader>tv", { mode = "n" })

vim.keymap.set("n", "<leader>bb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

if vim.g.finder ~= "fff" then
  vim.keymap.set("n", "<leader>sg", function()
    Snacks.picker.grep()
  end, { desc = "Grep" })
  vim.keymap.set("n", "<leader>.", function()
    Snacks.picker.files({ exclude = { "*.pdf", "*.eps" } })
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.smart()
  end, { desc = "Smart open" })
  vim.keymap.set("n", "<leader>fc", function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
  end, { desc = "Find Config File" })

  vim.keymap.set("n", "<leader>f,", function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
  end, { desc = "Find Config File" })

  vim.keymap.set("n", "<leader>sc", function()
    Snacks.picker.grep({ dirs = { vim.fn.stdpath("config") } })
  end, { desc = "Grep Config Files" })
end

vim.keymap.set("n", "<leader>fE", function()
  Snacks.picker.explorer()
end, { desc = "Explorer" })

vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.git_files()
end, { desc = "Find Git Files" })

vim.keymap.set("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>sb", function()
  Snacks.picker.lines()
end, { desc = "Buffer Lines" })

vim.keymap.set("n", "<leader>sB", function()
  Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

vim.keymap.set("n", '<leader>s"', function()
  Snacks.picker.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>s:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>sj", function()
  Snacks.picker.jumps()
end, { desc = "Jumps" })

vim.keymap.set("n", "<leader>sl", function()
  Snacks.picker.loclist()
end, { desc = "Location List" })

vim.keymap.set("n", "<leader>sn", function()
  Snacks.picker.notifications()
end, { desc = "Notifications" })

vim.keymap.set("n", "<leader>sm", function()
  Snacks.picker.marks()
end, { desc = "Marks" })

vim.keymap.set("n", "<leader>sR", function()
  Snacks.picker.resume()
end, { desc = "Resume" })

vim.keymap.set("n", "<leader>sq", function()
  Snacks.picker.qflist()
end, { desc = "Quickfix List" })

vim.keymap.set("n", "<leader>su", function()
  Snacks.picker.undo()
end, { desc = "Undo tree" })

vim.keymap.set("n", "<leader>sz", function()
  Snacks.picker.zoxide()
end, { desc = "Zoxide" })

vim.keymap.set("n", "<leader>hp", function()
  Snacks.picker.pickers()
end, { desc = "Pickers" })

vim.keymap.set("n", "<leader>hk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>ht", function()
  Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })

vim.keymap.set("n", "<leader>hT", function()
  local function get_colorscheme_files()
    local colorschemes = {}

    local handle = io.popen("fd -E 'init.lua' . /Users/haomingli/.config/nvim/lua/plugins/colorschemes/")
    if handle then
      for line in handle:lines() do
        table.insert(colorschemes, line)
      end
      handle:close()
    else
      print("Failed to execute fd command")
    end

    return colorschemes
  end
  local dirs = get_colorscheme_files()

  return Snacks.picker({
    finder = function()
      local items = {}
      for i, item in ipairs(dirs) do
        table.insert(items, {
          idx = i,
          file = item,
          text = item,
        })
      end
      return items
    end,
    layout = {
      layout = {
        box = "horizontal",
        width = 0.5,
        height = 0.5,
        {
          box = "vertical",
          border = "rounded",
          title = "Colorschemes",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
      },
    },
    format = function(item, picker)
      local file = item.file
      local filename = file:match("^.+/(.+)%.lua$")
      local ret = {}
      local a = Snacks.picker.util.align
      local icon, icon_hl = Snacks.util.icon(file.ft, "directory")
      -- ret[#ret + 1] = { a(icon, 3), icon_hl }
      -- ret[#ret + 1] = { " " }
      ret[#ret + 1] = { a(filename, 20) }
      -- ret[#ret + 1] = Snacks.picker.format.filename(item, picker)
      -- vim.list_extend(ret, Snacks.picker.format.filename(item, picker))

      return ret
    end,
    confirm = function(picker, item)
      picker:close()
      vim.cmd(([[luafile %s]]):format(item.file))
      do
        local theme_cmd = ([=[vim.cmd([[luafile %s]])]=]):format(item.file)
        local file_path = "/Users/haomingli/.config/nvim/lua/current_theme.lua"
        local file = io.open(file_path, "w")
        io.output(file)
        io.write(theme_cmd)
        io.close(file)
      end
    end,
  })
end, {})

vim.keymap.set("n", "<leader>ha", function()
  Snacks.picker.autocmds()
end, { desc = "Autocmds" })

vim.keymap.set("n", "<leader>hh", function()
  Snacks.picker.help()
end, { desc = "Help Pages" })

vim.keymap.set("n", "<leader>hH", function()
  Snacks.picker.highlights()
end, { desc = "Highlights" })

vim.keymap.set("n", "<leader>hi", function()
  Snacks.picker.icons()
end, { desc = "Icons" })

vim.keymap.set("n", "<leader>hc", function()
  Snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>hl", function()
  Snacks.picker.lazy()
end, { desc = "Lazy" })

vim.keymap.set("n", "<leader>:", function()
  Snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>hM", function()
  Snacks.picker.man()
end, { desc = "Man Pages" })

vim.keymap.set("n", "<leader>sQ", function()
  Snacks.picker.grep({ cwd = "~/.config/nvim/after/queries/" })
end, {})

vim.keymap.set("n", "<leader>yy", function()
  Snacks.picker.files({ cwd = "~/.config/nvim/luasnippets/" })
end, {})

vim.keymap.set("n", "<leader>yg", function()
  Snacks.picker.grep({ cwd = "~/.config/nvim/luasnippets/" })
end, {})

vim.keymap.set("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gR", function()
  Snacks.picker.lsp_references()
end, { desc = "References", nowait = true })

vim.keymap.set("n", "gI", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })

vim.keymap.set("n", "gy", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })

vim.keymap.set("n", "<leader>a", function()
  local cur_cursor = vim.api.nvim_win_get_cursor(0)
  local picker = Snacks.picker.lsp_symbols({
    filter = {
      tex = {
        "Class",
        "Constructor",
        -- "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package", -- remove package since luals uses it for control flow structures
        "Property",
        "Struct",
        "Trait",
      },
    },
  })
  ---source: dropbar.nvim
  ---Check if cursor is in range
  ---@param cursor integer[] cursor position (line, character); (1, 0)-based
  ---@param range table 0-based range
  ---@return boolean
  local function cursor_in_range(cursor, range)
    local cursor0 = { cursor[1] - 1, cursor[2] }
    return (cursor0[1] > range.start.line or (cursor0[1] == range.start.line and cursor0[2] >= range.start.character))
      and (cursor0[1] < range["end"].line or (cursor0[1] == range["end"].line and cursor0[2] <= range["end"].character))
  end

  picker.matcher.task:on("done", function()
    vim.schedule(function()
      if picker.list:count() == 0 then
        return
      end
      local symbols = picker:items()
      for i = #symbols, 1, -1 do
        if cursor_in_range(cur_cursor, symbols[i].range) then
          picker.list:move(symbols[i].idx, true)
          return
        end
      end
    end)
  end)
end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>SS", function()
  Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>Ss", function()
  Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<leader>un", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
vim.keymap.set("n", "<leader>N", function()
  Snacks.notifier.show_history()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>A", function()
  Snacks.dashboard()
end, {})
vim.keymap.set("n", "<M-g>", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gf", function()
  Snacks.lazygit.log_file()
end, { desc = "Lazygit Current File History" })
vim.keymap.set("n", "<leader>gl", function()
  Snacks.lazygit.log()
end, { desc = "Lazygit Log (cwd)" })
vim.keymap.set({ "n", "t" }, "<m-t>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>zp", function()
  Snacks.terminal({ "fish", "-c", "zp" })
end, { desc = "Find zotero pdfs" })
vim.keymap.set({ "n", "t" }, "<leader><C-`>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })

require("snacks").setup({
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        {
          action = ":lua Snacks.dashboard.pick('files')",
          desc = "Find File",
          icon = " ",
          key = ".",
        },
        {
          action = ":ene | startinsert",
          desc = "New File",
          icon = " ",
          key = "e",
        },
        {
          action = ":lua Snacks.dashboard.pick('live_grep')",
          desc = "Find Text",
          icon = " ",
          key = "g",
        },
        {
          action = ":lua Snacks.dashboard.pick('oldfiles')",
          desc = "Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          desc = "Config",
          icon = " ",
          key = "c",
        },
        {
          desc = "Restore Session",
          icon = " ",
          key = "S",
          section = "session",
        },
        -- {
        --   action = ":Lazy",
        --   desc = "Lazy",
        --   enabled = false,
        --   icon = "󰒲 ",
        --   key = "L",
        -- },
        {
          action = ":qa",
          desc = "Quit",
          icon = " ",
          key = "q",
        },
      },
    },
    sections = {
      {
        section = "header",
      },
      {
        icon = " ",
        indent = 2,
        padding = 1,
        section = "keys",
        title = "Keymaps",
      },
      {
        icon = " ",
        indent = 2,
        padding = 1,
        section = "recent_files",
        title = "Recent Files",
      },
      {
        icon = " ",
        indent = 2,
        padding = 1,
        section = "projects",
        title = "Projects",
      },
      -- {
      --   section = "startup",
      -- },
    },
  },
  explorer = {
    replace_netrw = false,
  },
  image = {
    doc = {
      enabled = true,
      inline = true,
    },
    enabled = false,
    force = true,
    math = {
      enabled = false,
    },
  },
  indent = {
    enabled = false,
    filter = function(buf)
      return not vim.bo[buf].filetype == "tex"
    end,
    indent = {
      char = "│",
    },
    scope = {
      char = "│",
    },
  },
  input = {
    enabled = true,
  },
  lazygit = {
    enabled = true,
  },
  notifier = {
    enabled = true,
  },
  picker = {
    enabled = true,
    formatters = {
      file = {
        filename_first = true,
      },
    },
  },
  quickfile = {
    enabled = true,
  },
  statuscolumn = {
    enabled = true,
  },
})
