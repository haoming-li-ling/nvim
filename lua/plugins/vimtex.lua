return {
  {
    "richwomanbtc/overleaf.nvim",
    cmd = "Overleaf",
    config = function()
      require("overleaf").setup({
        cookie = "s%3A1mGkt0ddiALr1ONXn8PwGy4xojebWJCk.b2M4oWNWEcNLK7IPXvTYKtWQg8duvyJrgkEJRoGm25M",
      })
    end,
    build = "cd node && npm install",
  },

  {
    "jbyuki/nabla.nvim",
    enabled = false,
    config = function()
      vim.cmd([[nnoremap <leader>p :lua require("nabla").popup()<CR>]])
    end,
  },

  -- {
  -- 	"f3fora/nvim-texlabconfig",
  -- 	-- enabled = false,
  -- 	ft = { "tex", "bib" },
  -- 	build = "go build -o ~/bin/",
  -- 	config = function()
  -- 		require("texlabconfig").setup()
  -- 	end,
  -- },
  {
    "haoming-li-ling/latex.nvim",
    enabled = false,
    dev = true,
    ft = { "tex" },
    config = function()
      require("latex").setup({
        conceals = {
          enabled = {
            "greek",
            "math",
            "script",
            -- "delim",
            -- "font",
          },
          add = {
            llbracket = "⟦",
            rrbracket = "⟧",
            langle = "〈",
            rangle = "〉",
            [","] = "",
            [";"] = "",
            [" "] = " ",
            ["{"] = "{",
            ["}"] = "}",
            ["lvert"] = "|",
            ["rvert"] = "|",
            -- Longleftrightarrow = "⟺",
            -- leadsto = "↝",
            -- Diamond = "◇",
            -- Box = "□",
          },
        },
        imaps = {
          enabled = false,
          add = {},
          default_leader = "`",
        },
        surrounds = {
          enabled = false,
          command = "c",
          environment = "e",
        },
      })
    end,
  },
  {
    "lervag/vimtex",
    enabled = true,
    init = function()
      vim.o.conceallevel = 2
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_syntax_conceal_disable = 1
      -- vim.g.vimtex_view_method = "sioyek"
      -- vim.g.vimtex_callback_progpath = "/Users/haomingli/.local/share/bob/nvim-bin/nvim"
      vim.g.vimtex_view_method = "skim"
      -- vim.g.vimtex_view_method = "texshop"
      vim.g.vimtex_imaps_enabled = 0
      -- vim.g.vimtex_imaps_leader = "<nop>"
      -- vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_activate = 0
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_text_obj_variant = "vimtex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_fold_enabled = 0
      vim.g.vimtex_fold_types = {
        preamble = { enabled = 1 },
        sections = { enabled = 0 },
        comment_pkg = { enabled = 0 },
        comments = { enabled = 0 },
        markers = { enabled = 0 },
        envs = { enabled = 0 },
        env_options = { enabled = 0 },
        items = { enabled = 0 },
        cmd_single = { enabled = 0 },
        cmd_single_opt = { enabled = 0 },
        cmd_multi = { enabled = 0 },
        cmd_addplot = { enabled = 0 },
      }
      vim.g.latex_fold_preamble = 1
      vim.g.vimtex_toc_config = {
        resize = 0,
        hotkeys_enabled = 1,
        hotkeys_leader = ",",
        indent_levels = 1,
        show_help = 0,
        layer_status = {
          label = 0,
        },
      }
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "./output",
        -- out_dir = "./output",
        out_dir = ".",
      }
      vim.g.vimtex_indent_on_ampersands = 0
      vim.g.vimtex_syntax_conceal = {
        sections = 0,
        spacing = 0,
      }
      vim.g.vimtex_syntax_custom_cmds = {
        { name = "mathbf", mathmode = 1, conceal = 1, argstyle = "bold" },
        { name = "mathit", mathmode = 1, conceal = 1, argstyle = "ital" },
        { name = "phantom", mathmode = 1, conceal = 1 },
        { name = "R", mathmode = 1, concealchar = "ℝ" },
        {
          name = "emph",
          conceal = 1,
          argstyle = "ital",
        },
        {
          name = "textsc",
          conceal = 1,
          argstyle = "bold",
        },
        {
          name = "textbf",
          conceal = 1,
          argstyle = "bold",
        },
        {
          name = "textbf",
          mathmode = 1,
          conceal = 1,
          argstyle = "bold",
        },
        { name = "leadsto", mathmode = 1, concealchar = "⇝ " },
        { name = "llbracket", mathmode = 1, concealchar = "⟦" },
        { name = "rrbracket", mathmode = 1, concealchar = "⟧" },
        { name = "Diamond", mathmode = 1, concealchar = "◇" },
        { name = "Box", mathmode = 1, concealchar = "□" },
        -- { name = "ll", mathmode = 1, concealchar = "⟦" },
        -- { name = "rr", mathmode = 1, concealchar = "⟧" },
        -- { name = "phantomsection", conceal = 1 },
        { name = "langle", mathmode = 1, conceal = 1, concealchar = "⟨" },
        { name = "rangle", mathmode = 1, conceal = 1, concealchar = "⟩" },
        -- { name = "ex", concealchar = "例" },
        -- { name = "pex", concealchar = "例" },
        -- { name = "xe", concealchar = "完" },
        -- { name = "xe", concealchar = "¶" },
        -- { name = "xe", concealchar = "‾" },
        -- { name = "gla", concealchar = "原" },
        -- { name = "glb", concealchar = "释" },
        -- { name = "glft", concealchar = "译" },
        -- { name = "a", concealchar = "⦿" },
        -- { name = "b", concealchar = "⦿" },
        -- { name = "c", concealchar = "⦿" },
        -- { name = "d", concealchar = "⦿" },
        { name = "ljudge", conceal = 1 },
        { name = "judge", conceal = 1 },
        { name = "nogloss", conceal = 1 },
        -- { name = "begingl", concealchar = "注" },
        -- { name = "endgl", concealchar = "完" },
        -- { name = "glpreamble", concealchar = "前" },
        -- { name = "endpreamble", concealchar = "完" },
        -- { name = "%", concealchar = "%" },
      }
      -- vim.g.vimtex_indent_lists = {
      --   "itemize",
      --   "description",
      --   "enumerate",
      --   "thebibliography",
      -- }
      vim.g.vimtex_indent_delims = {
        open = {
          "{",
          "[",
          "\\\\begingl",
          "\\\\starts",
        },
        close = {
          "}",
          "]",
          "\\\\endgl",
          "\\\\ends",
        },
        close_indented = 0,
        include_modified_math = 1,
      }
      vim.g.vimtex_env_toggle_map = {
        itemize = "enumerate",
        enumerate = "itemize",
      }
      vim.g.vimtex_delim_timeout = 100
      vim.g.vimtex_delim_stopline = 100
      vim.g.vimtex_matchparen_enabled = 0
      vim.g.vimtex_delim_list = {
        delim_tex = {
          name = {
            { [[\begingl]], [[\endgl]] },
          },
        },
        delim_math = {
          name = {
            { "{", "}" },
            { [[(]], [[)]] },
            { "[", "]" },
            { [[\{]], [[\}]] },
            { [[\langle]], [[\rangle]] },
            { [[\lbrace]], [[\rbrace]] },
            { [[\lvert]], [[\rvert]] },
            { [[\lVert]], [[\rVert]] },
            { [[\lfloor]], [[\rfloor]] },
            { [[\lceil]], [[\rceil]] },
            { [[\ulcorner]], [[\urcorner]] },
            { [[\llbracket]], [[\rrbracket]] },
          },
        },
      }
    end,
    config = function()
      local tex_ft = vim.api.nvim_create_augroup("tex_ft", { clear = true })
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "tex",
        group = tex_ft,
        callback = function()
          -- vim.bo.conceallevel = 2
          -- vim.bo.inccommand = ""
          -- vim.bo.syntax = "ON"
          vim.opt_local.spell = true
          vim.opt_local.foldlevel = 0
          vim.opt_local.spelllang = { "en" }
          vim.b.latex_symbol = false

          vim.keymap.set(
            "n",
            "<leader>mc",
            "<cmd>LspTexlabCleanAuxiliary<cr>",
            { buffer = true, silent = false, desc = "texlab clean auxiliary files" }
          )
          vim.keymap.set(
            "n",
            "<leader>mC",
            "<cmd>LspTexlabCleanArtifacts<cr>",
            { buffer = true, silent = false, desc = "texlab clean artifacts" }
          )
          vim.keymap.set(
            "n",
            "<leader>mA",
            "<cmd>LspTexlabCancelBuild<cr>",
            { buffer = true, silent = false, desc = "texlab cancel build" }
          )
          vim.keymap.set(
            "n",
            "<leader>ma",
            "<cmd>w | LspTexlabBuild<cr>",
            { buffer = true, silent = false, desc = "texlab build" }
          )
          vim.keymap.set(
            "n",
            "<leader>ml",
            -- "<cmd>e " .. vim.fn.expand("%:p:h") .. "/output/" .. vim.fn.expand("%:p:t:r") .. ".log<cr>"
            "<cmd>e %:p:h/output/%:p:t:r.log<cr>"
          )
          vim.keymap.set(
            "n",
            "<leader>mbl",
            -- "<cmd>e " .. vim.fn.expand("%:p:h") .. "/output/" .. vim.fn.expand("%:p:t:r") .. ".log<cr>"
            "<cmd>e %:p:h/output/%:p:t:r.blg<cr>"
          )
          vim.keymap.set(
            "n",
            "<leader>mv",
            "<cmd>LspTexlabForward<cr>",
            -- "<localleader>lv",
            {
              buffer = true,
              remap = true,
              silent = false,
              desc = "texlab forward search",
            }
          )
          vim.keymap.set("n", "<c-\\>", ":VimtexTocOpen<cr>", { buffer = true, silent = true, desc = "Open TeX ToC" })

          -- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets/tex" })
          -- vim.cmd([[call vimtex#syntax#core#new_region_math('tikzcd')]])
        end,
      })
      -- vim.api.nvim_create_autocmd("User", {
      -- 	pattern = { "VimtexEventViewReverse" },
      -- 	callback = function()
      -- 		local term = "Wezterm"
      -- 		-- local term = "Ghostty"
      -- 		if vim.g.neovide then
      -- 			term = "Neovide"
      -- 		end
      -- 		vim.cmd(([[
      --            silent execute "!open -a %s"
      --            " redraw!
      --          ]]):format(term))
      -- 	end,
      -- })
      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = { "VimtexEventView" },
      --   callback = function()
      --     local term = "Wezterm"
      --     -- local term = "Ghostty"
      --     if vim.g.neovide then
      --       term = "Neovide"
      --     end
      --     vim.cmd(([[
      --         silent execute "!sleep 0.3; open -a %s"
      --         redraw!
      --       ]]):format(term))
      --   end,
      --   -- command = "call b:vimtex.viewer.xdo_focus_vim()",
      -- })
      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventTocCreated",
        callback = function()
          vim.keymap.set("n", "<c-\\>", ":VimtexTocToggle<cr>", { buffer = true, silent = true })
        end,
      })
    end,
    dependencies = {},
  },
}
