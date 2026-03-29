local languages = {
  "rust",
  "javascript",
  "fennel",
  "typescript",
  "fish",
  "bash",
  "json",
  "html",
  "css",
  "python",
  "r",
  "bibtex",
  "latex",
  "vim",
  "lua",
  "toml",
  "yaml",
  "nu",
  "query",
  "typst",
  -- "elisp",
  -- "lilypond",
  "zsh",
  "c",
  "cpp",
}
return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(languages)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match
          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end
          vim.treesitter.start(buf, language)

          -- you need some mechanism to avoid running on buffers that do not
          -- correspond to a language (like oil.nvim buffers), this implementation
          -- checks if a parser exists for the current language
          --
          -- -- replicate `fold = { enable = true }`
          -- -- if filetype ~= "tex" then
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- -- end
          vim.wo.foldenable = false
          --
          -- -- replicate `highlight = { enable = true }`
          if filetype == "tex" then
            -- vim.treesitter.start(buf, "latex")
            vim.bo[buf].syntax = "ON"
            local highlights = vim.api.nvim_exec2("highlight", { output = true }).output
            for _, line in ipairs(vim.split(highlights, "\n")) do
              local name = line:match("^(%S+)")
              if name and name:lower():find("^tex") then
                vim.cmd("hi! link " .. name .. " NONE")
              end
            end
            return
          end

          -- replicate `indent = { enable = true }`
          -- if filetype ~= "tex" then
          -- 	vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          -- end
          -- `incremental_selection = { enable = true }` cannot be easily replicated
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module 'treesitter-modules'
    ---@type ts.mod.UserConfig
    opts = {
      -- list of parser names, or 'all', that must be installed
      ensure_installed = languages,
      -- list of parser names, or 'all', to ignore installing
      ignore_install = {},
      -- install parsers in ensure_installed synchronously
      sync_install = false,
      -- automatically install missing parsers when entering buffer
      auto_install = true,
      fold = {
        enable = true,
      },
      highlight = {
        enable = true,
        -- disable = { "latex" },
        additional_vim_regex_highlighting = {
          "latex",
          -- "lua",
        },
      },
      incremental_selection = {
        enable = false,
        -- set value to `false` to disable individual mapping
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          scope_incremental = "grc",
          node_decremental = "<C-p>",
        },
      },
      indent = {
        enable = true,
        disable = {
          "latex",
          -- "fennel",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- enabled = false,
    branch = "main",
    opts = {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@field.outer"] = "V",
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = false,
      },
    },
    -- keys = {
    -- 	{
    -- 		"aa",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"ia",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"ay",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"iy",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
    -- 		end,
    -- 	},
    -- 	{
    -- 		"af",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"if",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"aO",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"iO",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"ao",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"io",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"aF",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@field.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"az",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@statement.outer", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- 	{
    -- 		"iF",
    -- 		function()
    -- 			require("nvim-treesitter-textobjects.select").select_textobject("@field.inner", "textobjects")
    -- 		end,
    -- 		mode = { "x", "o" },
    -- 	},
    -- },
    config = function()
      -- local ft_textobject = vim.api.nvim_create_augroup("ft_textobject", { clear = true })
      -- vim.api.nvim_create_autocmd("FileType", {
      -- 	group = ft_textobject,
      -- 	callback = function(args)
      -- 		if args.match ~= "tex" then
      -- 			vim.keymap.set({ "n", "x" }, "aa", function()
      -- 				require("nvim-treesitter-textobjects.select").select_textobject(
      -- 					"@parameter.outer",
      -- 					"textobjects"
      -- 				)
      -- 			end)
      -- 			vim.keymap.set({ "n", "x" }, "ia", function()
      -- 				require("nvim-treesitter-textobjects.select").select_textobject(
      -- 					"@parameter.inner",
      -- 					"textobjects"
      -- 				)
      -- 			end)
      -- 		end
      -- 	end,
      -- })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- event = "VeryLazy",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
    -- init = function() vim.g.skip_ts_context_commentstring_module = true end,
    -- config = true,
  },
}
