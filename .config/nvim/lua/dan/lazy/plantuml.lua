return {
  "zapling/plantuml.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('plantuml').setup({
      tmp_dir = '/tmp/plantuml_nvim'
    })
  end
}
