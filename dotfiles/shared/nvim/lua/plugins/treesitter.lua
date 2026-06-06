return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "arduino", "bash", "c", "c_sharp", "cmake", "cpp", "css",
      "csv", "dockerfile", "git_config", "git_rebase", "gitattributes",
      "gitcommit", "gitignore", "html", "java", "javascript", "json",
      "lua", "markdown", "markdown_inline","nginx","passwd", "php",
      "python", "r", "ruby", "rust", "sql", "ssh_config", "typescript",
      "vim", "xml", "vue", "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
