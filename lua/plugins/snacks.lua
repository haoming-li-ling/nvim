return {
  {
    "krissen/snacks-bibtex.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      -- optional overrides (see below)
      global_files = { "~/Documents/MIT/Distributivity.bib", "~/Documents/MIT/Anti-locality.bib" },
      display = {
        show_key = false,
      },
      context = {
        enabled = true,
        fallback = true,
      },
    },
    keys = {
      {
        "<C-b><C-b>",
        function()
          require("snacks-bibtex").bibtex()
        end,
        mode = "i",
        desc = "citation key",
      },
      {
        "<C-b><C-t>",
        function()
          require("snacks-bibtex").bibtex({ mappings = { ["<CR>"] = { kind = "citation_command", id = "\\citet" } } })
        end,
        mode = "i",
        desc = "text cite",
      },
      {
        "<C-b><C-p>",
        function()
          require("snacks-bibtex").bibtex({ mappings = { ["<CR>"] = { kind = "citation_command", id = "\\citep" } } })
        end,
        mode = "i",
        desc = "paren cite",
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    init = function()
      local f = function(args)
        local bt = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
        if bt == "nofile" then
          vim.b[args.buf].miniindentscope_disable = true
        end
      end
      vim.api.nvim_create_autocmd("User", {
        pattern = "SnacksDashboardOpened",
        callback = f,
      })
      -- local f = function(args)
      -- 	local bt = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
      -- 	if bt == "nofile" then
      -- 		vim.b[args.buf].miniindentscope_disable = true
      -- 	end
      -- 	-- vim.b[args.buf].miniindentscope_disable = true
      -- end
      -- vim.api.nvim_create_autocmd("Filetype", {
      -- 	-- pattern = "snacks_dashboard",
      -- 	callback = f,
      -- })
      -- vim.api.nvim_create_autocmd("BufEnter", {
      -- 	-- pattern = "snacks_dashboard",
      -- 	callback = function()
      -- 		-- if args.buf
      -- 		local bt = vim.api.nvim_get_option_value("buftype", { buf = 0 })
      -- 		if bt == "nofile" then
      -- 			vim.b.miniindentscope_disable = true
      -- 		end
      -- 	end,
      -- })

      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
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
        end,
      })
    end,
    keys = {
      {
        vim.g.snack_prefix .. "bb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        vim.g.snack_prefix .. "sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        vim.g.snack_prefix .. ".",
        function()
          Snacks.picker.files({ exclude = { "*.pdf", "*.eps" } })
        end,
        desc = "Find Files",
      },
      -- {
      --   vim.g.snack_prefix .. "zp",
      --   function()
      --     local function get_pdf_files()
      --       local pdfs = {}
      --
      --       local handle = io.popen("fd -e pdf . /Users/haomingli/Zotero/")
      --       if handle then
      --         for line in handle:lines() do
      --           table.insert(pdfs, line)
      --         end
      --         handle:close()
      --       else
      --         print("Failed to execute fd command")
      --       end
      --
      --       return pdfs
      --     end
      --     local pdfs = get_pdf_files()
      --     return Snacks.picker({
      --       preview = function(ctx)
      --         ctx.preview:set_lines(vim.split(vim.system({ "less", ctx.item.file }, { text = true }):wait().stdout, "\n"))
      --       end,
      --       finder = function()
      --         local items = {}
      --         for i, item in ipairs(pdfs) do
      --           table.insert(items, {
      --             idx = i,
      --             file = item,
      --             text = item,
      --           })
      --         end
      --         return items
      --       end,
      --       -- layout = {
      --       --   layout = {
      --       --     box = "horizontal",
      --       --     width = 0.8,
      --       --     height = 0.8,
      --       --     {
      --       --       box = "vertical",
      --       --       border = "rounded",
      --       --       title = "PDFs",
      --       --       { win = "input", height = 1, border = "bottom" },
      --       --       { win = "list", border = "none" },
      --       --     },
      --       --   },
      --       -- },
      --       format = function(item, picker)
      --         local file = item.file
      --         local filename = file:match("^.+/(.+)%.pdf$")
      --         local ret = {}
      --         local a = Snacks.picker.util.align
      --         local icon, icon_hl = Snacks.util.icon(file.ft, "pdf")
      --         ret[#ret + 1] = { a(icon, 3), icon_hl }
      --         -- ret[#ret + 1] = { " " }
      --         ret[#ret + 1] = { a(filename, 20) }
      --         -- ret[#ret + 1] = Snacks.picker.format.filename(item, picker)
      --         -- vim.list_extend(ret, Snacks.picker.format.filename(item, picker))
      --
      --         return ret
      --       end,
      --       confirm = function(picker, item)
      --         vim.ui.open(item.file)
      --         picker:close()
      --       end,
      --     })
      --   end,
      --   desc = "Find pdfs",
      -- },
      {
        vim.g.snack_prefix .. "<space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart open",
      },
      -- {
      -- 	"<C-p>",
      -- 	function()
      -- 		Snacks.picker.files({
      -- 			layout = {
      -- 				reverse = true,
      -- 				layout = {
      -- 					box = "horizontal",
      -- 					backdrop = false,
      -- 					row = -1,
      -- 					width = 0,
      -- 					height = 0.4,
      -- 					border = "top",
      -- 					title = " {title} {live} {flags}",
      -- 					title_pos = "left",
      -- 					{
      -- 						box = "vertical",
      -- 						{ win = "list", border = "none" },
      -- 						{ win = "input", height = 1, border = "top" },
      -- 					},
      -- 					{ win = "preview", title = "{preview}", width = 0.6, border = "left" },
      -- 				},
      -- 			},
      -- 		})
      -- 	end,
      -- 	desc = "Ctrl-p",
      -- },
      -- find
      -- { vim.g.snack_prefix .. "fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      {
        vim.g.snack_prefix .. "fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      {
        vim.g.snack_prefix .. "sc",
        function()
          Snacks.picker.grep({
            dirs = {
              vim.fn.stdpath("config"),
            },
          })
        end,
        desc = "Grep Config Files",
      },
      {
        vim.g.snack_prefix .. "fE",
        function()
          Snacks.picker.explorer()
        end,
        desc = "Explorer",
      },
      -- { vim.g.snack_prefix .. "f,", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      {
        vim.g.snack_prefix .. "f,",
        function()
          Snacks.picker.lazy()
        end,
        desc = "Lazy",
      },
      -- { vim.g.snack_prefix .. "ff", function() Snacks.picker.files() end, desc = "Find Files" },
      {
        vim.g.snack_prefix .. "fg",
        function()
          Snacks.picker.git_files()
        end,
        desc = "Find Git Files",
      },
      {
        vim.g.snack_prefix .. "fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent",
      },
      -- git
      {
        vim.g.snack_prefix .. "gl",
        function()
          Snacks.picker.git_log()
        end,
        desc = "Git Log",
      },
      {
        vim.g.snack_prefix .. "gs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      -- Grep
      {
        vim.g.snack_prefix .. "sb",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        vim.g.snack_prefix .. "sB",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      {
        vim.g.snack_prefix .. "sw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      {
        vim.g.snack_prefix .. 's"',
        function()
          Snacks.picker.registers()
        end,
        desc = "Registers",
      },
      {
        vim.g.snack_prefix .. "s:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        vim.g.snack_prefix .. "sd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        vim.g.snack_prefix .. "sj",
        function()
          Snacks.picker.jumps()
        end,
        desc = "Jumps",
      },
      {
        vim.g.snack_prefix .. "sl",
        function()
          Snacks.picker.loclist()
        end,
        desc = "Location List",
      },
      {
        vim.g.snack_prefix .. "sn",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notifications",
      },
      {
        vim.g.snack_prefix .. "sm",
        function()
          Snacks.picker.marks()
        end,
        desc = "Marks",
      },
      {
        vim.g.snack_prefix .. "sR",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        vim.g.snack_prefix .. "sq",
        function()
          Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
      },
      -- {
      --   vim.g.snack_prefix .. "pp",
      --   function()
      --     Snacks.picker.projects()
      --   end,
      --   desc = "Projects",
      -- },
      {
        vim.g.snack_prefix .. "su",
        function()
          Snacks.picker.undo()
        end,
        desc = "Undo tree",
      },
      {
        vim.g.snack_prefix .. "sz",
        function()
          Snacks.picker.zoxide()
        end,
        desc = "Zoxide",
      },
      -- Help
      {
        vim.g.snack_prefix .. "hp",
        function()
          Snacks.picker.pickers()
        end,
        desc = "Pickers",
      },
      {
        vim.g.snack_prefix .. "hk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        vim.g.snack_prefix .. "ht",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      {
        vim.g.snack_prefix .. "hT",
        function()
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
        end,
      },
      {
        vim.g.snack_prefix .. "ha",
        function()
          Snacks.picker.autocmds()
        end,
        desc = "Autocmds",
      },
      {
        vim.g.snack_prefix .. "hh",
        function()
          Snacks.picker.help()
        end,
        desc = "Help Pages",
      },
      {
        vim.g.snack_prefix .. "hH",
        function()
          Snacks.picker.highlights()
        end,
        desc = "Highlights",
      },
      {
        vim.g.snack_prefix .. "hi",
        function()
          Snacks.picker.icons()
        end,
        desc = "Icons",
      },
      {
        vim.g.snack_prefix .. "hc",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        vim.g.snack_prefix .. "hl",
        function()
          Snacks.picker.lazy()
        end,
        desc = "Lazy",
      },
      {
        vim.g.snack_prefix .. ":",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        vim.g.snack_prefix .. "hM",
        function()
          Snacks.picker.man()
        end,
        desc = "Man Pages",
      },
      -- Snippt
      {
        vim.g.snack_prefix .. "sQ",
        function()
          Snacks.picker.grep({ cwd = "~/.config/nvim/after/queries/" })
        end,
      },
      {
        vim.g.snack_prefix .. "yy",
        function()
          Snacks.picker.files({ cwd = "~/.config/nvim/luasnippets/" })
        end,
      },
      {
        vim.g.snack_prefix .. "yg",
        function()
          Snacks.picker.grep({ cwd = "~/.config/nvim/luasnippets/" })
        end,
      },
      -- LSP
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gR",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gI",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      {
        vim.g.snack_prefix .. "a",
        function()
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
            return (
              cursor0[1] > range.start.line
              or (cursor0[1] == range.start.line and cursor0[2] >= range.start.character)
            )
              and (
                cursor0[1] < range["end"].line
                or (cursor0[1] == range["end"].line and cursor0[2] <= range["end"].character)
              )
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
        end,
        desc = "LSP Symbols",
      },
      -- {
      --   vim.g.snack_prefix .. "hb",
      --   function()
      --     pick_cmd_result({
      --       cmd = "bibtex-ls",
      --       args = { vim.api.nvim_buf_get_var(0, "bibfiles") },
      --       -- confirm = "put",
      --       confirm = function(picker, item, action)
      --         ---@cast action snacks.picker.yank.Action
      --         picker:close()
      --         if item then
      --           local value = item[action.field] or item.data or item.text
      --           local formatted_value = vim.fn.system('bibtex-cite -prefix="\\citet{" -postfix="}" -separator=","', value)
      --           vim.api.nvim_put({ formatted_value }, "", true, true)
      --         end
      --       end,
      --       preview = "preview",
      --       -- actions = {
      --       --   ["<cr>"] =
      --       -- }
      --     })
      --   end,
      -- },
      {
        "<leader>SS",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>Ss",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<leader>N",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>A",
        function()
          Snacks.dashboard()
        end,
      },
      {
        "<m-g>",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
      {
        "<m-t>",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
        mode = { "n", "t" },
      },
      {
        "<leader>zp",
        function()
          Snacks.terminal({ "fish", "-c", "zp" })
        end,
        desc = "Find zotero pdfs",
      },
      {
        "<C-`>",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
        mode = { "n", "t" },
      },
    },
    opts = {
      statuscolumn = {
        enabled = true,
      },
      input = {
        enabled = true,
      },
      image = {
        enabled = false,
        force = true,
        doc = {
          enabled = true,
          inline = true,
        },
        math = {
          enabled = false,
        },
      },
      explorer = {
        replace_netrw = false,
      },
      picker = {
        enabled = true,
        formatters = {
          file = {
            filename_first = true,
          },
        },
      },
      notifier = {
        enabled = true,
      },
      indent = {
        enabled = false,
        indent = {
          char = vim.env.WEZTERM_CONFIG_DIR and "┃" or "│",
        },
        scope = {
          char = vim.env.WEZTERM_CONFIG_DIR and "┃" or "│",
        },
        filter = function(buf)
          return not vim.bo[buf].filetype == "tex"
        end,
      },
      quickfile = {
        enabled = true,
      },
      lazygit = {
        enabled = true,
      },
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = " ", key = ".", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "S", desc = "Restore Session", section = "session" },
            {
              icon = "󰒲 ",
              key = "L",
              desc = "Lazy",
              action = ":Lazy",
              enabled = package.loaded.lazy ~= nil,
            },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "header",
          },
          {
            icon = " ",
            title = "Keymaps",
            section = "keys",
            indent = 2,
            padding = 1,
          },
          {
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          {
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
          },
          {
            section = "startup",
          },
        },
      },
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
}
