vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
})

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

require("nvim-treesitter-textobjects").setup({
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
})

require("ts_context_commentstring").setup({
  enable_autocmd = false,
})
