return {
  'rest-nvim/rest.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  ft = 'http',
  config = function()
    require('rest-nvim').setup({
      result_split_horizontal = false,
      result_spint_inplace = false,
      stay_in_current_window_after_split = false,
      skip_ssl_verification = false,
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        show_url = true,
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        format = true,
        formatters = {
          json = "jq",
          vnd = "jq",
        },
      },
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end,
  keys = {
    {
      "<leader>rr",
      "<cmd>Rest run<CR>",  -- This should work for running requests
      desc = "Test the current file",
    },
  },
}

