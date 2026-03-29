return {
  "folke/which-key.nvim",
  enabled = vim.g.whichkey,
  event = "VeryLazy",
  opts = {
    preset = "helix",
    disable = {
      ft = { "TelescopePrompt", "vimtex-toc" },
    },
    -- triggers_blacklist = {
    -- n = { "d", "y", "c", "v", "V" },
    -- },
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- key_labels = {
    -- 	-- override the label used to display some keys. It doesn't effect WK in any other way.
    -- 	-- For example:
    -- 	-- ["<leader>"] = "SPC",
    -- 	-- ["<cr>"] = "RET",
    -- 	-- ["<CR>"] = "RET",
    -- 	-- ["<tab>"] = "TAB",
    -- },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "harpoon" },
      { "<leader>f", group = "file" },
      { "<leader>fg", group = "config" },
      { "<leader>fgI", "<cmd>e $MYINITVIM<cr>", desc = "init.lua" },
      { "<leader>fgK", "<cmd>e $MYCONFIGS/keymap.lua<cr>", desc = "whichkey" },
      { "<leader>fgL", "<cmd>e $MYCONFIGS/lualine/init.lua<cr>", desc = "lualine" },
      { "<leader>fgR", "<cmd>e $MYCONFIGS/treesitter.lua<cr>", desc = "treesitter" },
      { "<leader>fgT", "<cmd>e $MYCONFIGS/textcase.lua<cr>", desc = "text-case" },
      { "<leader>fgU", "<cmd>e $MYCONFIGS/../util.lua<cr>", desc = "utilities" },
      { "<leader>fga", "<cmd>e $MYCONFIGS/autopairs.lua<cr>", desc = "nvim-autopairs" },
      { "<leader>fgb", "<cmd>e $MYCONFIGS/ui/bufferline.lua<cr>", desc = "bufferline" },
      { "<leader>fgc", "<cmd>e $MYCONFIGS/cmp.lua<cr>", desc = "nvim-cmp" },
      { "<leader>fgl", group = "lsp" },
      { "<leader>fgll", "<cmd>e $MYCONFIGS/lsp/init.lua<cr>", desc = "config" },
      { "<leader>fglu", "<cmd>e $MYCONFIGS/lsp/util.lua<cr>", desc = "utilities" },
      { "<leader>fgo", "<cmd>e $MYCONFIGS/neorg.lua<cr>", desc = "neorg" },
      { "<leader>fgr", "<cmd>e $MYCONFIGS/ui/nvim-tree.lua<cr>", desc = "nvim-tree" },
      { "<leader>fgt", group = "telescope" },
      { "<leader>fgtt", "<cmd>e $MYCONFIGS/telescope/init.lua<cr>", desc = "config" },
      { "<leader>fgtu", "<cmd>e $MYCONFIGS/telescope/util.lua<cr>", desc = "utilites" },
      { "<leader>fgv", "<cmd>e $MYCONFIGS/vimtex.lua<cr>", desc = "vimtex" },
      { "<leader>fgy", group = "luasnip" },
      { "<leader>fgyu", "<cmd>e $MYCONFIGS/luasnip/util.lua<cr>", desc = "utilities" },
      { "<leader>fgyy", "<cmd>e $MYCONFIGS/luasnip/init.lua<cr>", desc = "config" },
      { "<leader>g", group = "align" },
      { "<leader>h", group = "help" },
      { "<leader>i", group = "swap" },
      { "<leader>m", group = "commands" },
      { "<leader>l", group = "lsp" },
      { "<leader>n", group = "node" },
      { "<leader>p", group = "project" },
      { "<leader>q", group = "quit" },
      { "<leader>s", group = "search" },
      { "<leader>w", proxy = "<c-w>", group = "window" },
      { "<C-w>c", desc = "Close window" },
      { "<C-b>", desc = "bibtex" },
      { "<C-w>H", desc = "Swap window left" },
      { "<C-w>L", desc = "Swap window right" },
      { "<C-w>K", desc = "Swap window up" },
      { "<C-w>K", desc = "Swap window down" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>y", group = "snippet" },
      { vim.g.fzf_prefix, group = "fzf" },
      { vim.g.fzf_prefix .. "h", group = "help" },
      { vim.g.fzf_prefix .. "f", group = "files" },
      { vim.g.fzf_prefix .. "s", group = "search" },
      { vim.g.fzf_prefix .. "b", group = "buffers" },
      -- { "<leader>z", group = "ZZZ" },
      { "<leader>t", group = "text" },
      -- { "<leader>zz", "<cmd>q<cr>", desc = "Quit" },
    })
    local function ai_whichkey(opts)
      local objects = {
        { " ", desc = "whitespace" },
        { '"', desc = '" string' },
        { "'", desc = "' string" },
        { "(", desc = "() block" },
        { ")", desc = "() block with ws" },
        { "<", desc = "<> block" },
        { ">", desc = "<> block with ws" },
        { "?", desc = "user prompt" },
        { "U", desc = "use/call without dot" },
        { "[", desc = "[] block" },
        { "]", desc = "[] block with ws" },
        { "_", desc = "underscore" },
        { "`", desc = "` string" },
        { "$", desc = "math" },
        { "a", desc = "argument" },
        { "b", desc = ")]} block" },
        { "c", desc = "class" },
        { "d", desc = "digit(s)" },
        { "D", desc = "FOL coordinate" },
        { "e", desc = "CamelCase / snake_case" },
        { "f", desc = "function" },
        -- { "g", desc = "entire file" },
        { "g", desc = "gloss" },
        { "i", desc = "indent" },
        { "L", desc = "FOL Quantifier" },
        { "o", desc = "block, conditional, loop" },
        { "O", desc = "class" },
        { "q", desc = "string" },
        { "r", desc = "label id" },
        { "t", desc = "tag" },
        { "u", desc = "use/call" },
        { "x", desc = "example" },
        { "y", desc = "function call" },
        -- { "Y", desc = "command" },
        { "z", desc = "statement" },
        { "{", desc = "{} block" },
        { "}", desc = "{} with ws" },
      }

      ---@type wk.Spec[]
      local ret = { mode = { "o", "x" } }
      ---@type table<string, string>
      local mappings = vim.tbl_extend("force", {}, {
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",
      }, opts.mappings or {})
      mappings.goto_left = nil
      mappings.goto_right = nil

      for name, prefix in pairs(mappings) do
        name = name:gsub("^around_", ""):gsub("^inside_", "")
        ret[#ret + 1] = { prefix, group = name }
        for _, obj in ipairs(objects) do
          local desc = obj.desc
          if prefix:sub(1, 1) == "i" then
            desc = desc:gsub(" with ws", "")
          end
          ret[#ret + 1] = { prefix .. obj[1], desc = obj.desc }
        end
      end
      require("which-key").add(ret, { notify = false })
    end
    ai_whichkey({})
  end,
}
