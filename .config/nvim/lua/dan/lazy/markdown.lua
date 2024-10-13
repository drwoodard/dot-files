return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    -- Use vim.schedule to run install after ensuring Neovim is ready
    vim.schedule(function()
      if not vim.fn["mkdp#util#installed"]() then
        vim.fn["mkdp#util#install"]()
      end
    end)
  end,
}

