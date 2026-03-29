return {
  "mrjones2014/smart-splits.nvim",
  enabled = true,
  opts = {
    at_edge = "stop",
  },
  keys = {
    -- {
    -- 	"<A-h>",
    -- 	function()
    -- 		require("smart-splits").resize_left()
    -- 	end,
    -- },
    -- {
    -- 	"<A-j>",
    -- 	function()
    -- 		require("smart-splits").resize_down()
    -- 	end,
    -- },
    -- {
    -- 	"<A-k>",
    -- 	function()
    -- 		require("smart-splits").resize_up()
    -- 	end,
    -- },
    -- {
    -- 	"<A-l>",
    -- 	function()
    -- 		require("smart-splits").resize_right()
    -- 	end,
    -- },
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      mode = { "n", "x", "t" },
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      mode = { "n", "x", "t" },
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      mode = { "n", "x", "t" },
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      mode = { "n", "x", "t" },
    },
    {
      "<C-\\>",
      function()
        require("smart-splits").move_cursor_previous()
      end,
    },
    {
      "<leader><leader>h",
      function()
        require("smart-splits").swap_buf_left()
      end,
    },
    {
      "<leader><leader>j",
      function()
        require("smart-splits").swap_buf_down()
      end,
    },
    {
      "<leader><leader>k",
      function()
        require("smart-splits").swap_buf_up()
      end,
    },
    {
      "<leader><leader>l",
      function()
        require("smart-splits").swap_buf_right()
      end,
    },
  },
}
