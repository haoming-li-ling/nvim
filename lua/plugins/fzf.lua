return {
  "ibhagwan/fzf-lua",
  enabled = false,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { vim.g.fzf_prefix .. ".", "<cmd>FzfLua files<cr>", desc = "files" },
    { vim.g.fzf_prefix .. "bb", "<cmd>FzfLua buffers<cr>", desc = "buffers" },
    { vim.g.fzf_prefix .. "sg", "<cmd>FzfLua live_grep_native<cr>", desc = "live grep" },
    { vim.g.fzf_prefix .. "sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "current buffer search" },
    { vim.g.fzf_prefix .. "sT", "<cmd>FzfLua treesitter<cr>", desc = "treesitter" },
    { vim.g.fzf_prefix .. "ss", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "workspace symbols" },
    { vim.g.fzf_prefix .. "bi", "<cmd>FzfLua builtin<cr>", desc = "builtin" },
    { vim.g.fzf_prefix .. ":", "<cmd>FzfLua commands<cr>", desc = "commands" },
    { vim.g.fzf_prefix .. "/", "<cmd>FzfLua search_history<cr>", desc = "search history" },
    { vim.g.fzf_prefix .. "sh", "<cmd>FzfLua command_history<cr>", desc = "command history" },
    { vim.g.fzf_prefix .. "ht", "<cmd>FzfLua colorschemes<cr>", desc = "colorschemes" },
    { vim.g.fzf_prefix .. "hk", "<cmd>FzfLua keymaps<cr>", desc = "keymaps" },
    { vim.g.fzf_prefix .. "hc", "<cmd>FzfLua changes<cr>", desc = "changes" },
    { vim.g.fzf_prefix .. "hft", "<cmd>FzfLua filetypes<cr>", desc = "filetypes" },
    { vim.g.fzf_prefix .. "hh", "<cmd>FzfLua highlights<cr>", desc = "hightlights" },
    { vim.g.fzf_prefix .. "ha", "<cmd>FzfLua autocmds<cr>", desc = "autocmds" },
    { vim.g.fzf_prefix .. "<cr>", "<cmd>FzfLua spell_suggest<cr>", desc = "spell" },
    { vim.g.fzf_prefix .. "fP", "<cmd>FzfLua files cwd=~/.config/nvim/lua/plugins<cr>", desc = "plugin config" },
    { vim.g.fzf_prefix .. "f,", "<cmd>FzfLua files cwd=~/.config/nvim/lua/plugins<cr>", desc = "plugin config" },
    { vim.g.fzf_prefix .. "fu", "<cmd>FzfLua files cwd=~/.local/share/nvim<cr>", desc = "lua files" },
    { vim.g.fzf_prefix .. "su", "<cmd>FzfLua live_grep_native cwd=~/.local/share/nvim<cr>", desc = "lua files" },
    { vim.g.fzf_prefix .. "yy", "<cmd>FzfLua files cwd=~/.config/nvim/luasnippets<cr>", desc = "lua files" },
    { vim.g.fzf_prefix .. "hh", "<cmd>FzfLua help_tags<cr>", desc = "help tags" },
    { vim.g.fzf_prefix .. "h'", "<cmd>FzfLua registers<cr>", desc = "registers" },
    { vim.g.fzf_prefix .. "hm", "<cmd>FzfLua marks<cr>", desc = "marks" },
    {
      vim.g.fzf_prefix .. "pp",
      function()
        require("fzf-lua").fzf_exec(function(add_to_results)
          local contents = require("project_nvim").get_recent_projects()
          for _, project in pairs(contents) do
            add_to_results(project)
          end
          -- close the fzf named pipe, this signals EOF and terminates the fzf "loading" indicator.
          add_to_results()
        end, {
          prompt = "Projects> ",
          actions = {
            ["default"] = function(choice)
              vim.cmd.edit(choice[1])
            end,
            ["ctrl-x"] = {
              function(choice)
                local history = require("project_nvim.utils.history")
                local delete = vim.fn.confirm("Delete '" .. choice[1] .. "' projects? ", "&Yes\n&No", 2)
                if delete == 1 then
                  history.delete_project({ value = choice[1] })
                end
              end,
              require("fzf-lua").actions.resume,
            },
          },
        })
      end,
      -- function()
      -- 	local contents = require("project_nvim").get_recent_projects()
      -- 	local reverse = {}
      -- 	for i = #contents, 1, -1 do
      -- 		reverse[#reverse + 1] = contents[i]
      -- 	end
      -- 	require("fzf-lua").fzf_exec(reverse, {
      -- 		actions = {
      -- 			["default"] = function(e)
      -- 				vim.cmd.cd(e[1])
      -- 			end,
      -- 			["ctrl-d"] = function(x)
      -- 				local choice = vim.fn.confirm("Delete '" .. #x .. "' projects? ", "&Yes\n&No", 2)
      -- 				if choice == 1 then
      -- 					local history = require("project_nvim.utils.history")
      -- 					for _, v in ipairs(x) do
      -- 						history.delete_project(v)
      -- 					end
      -- 				end
      -- 			end,
      -- 		},
      -- 	})
      -- end,
      desc = "projects",
    },
  },
  lazy = true,
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      {
        -- "telescope",
        -- "skim",
      },
    })
  end,
}
