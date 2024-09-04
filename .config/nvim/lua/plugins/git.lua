return {
    {
        "FabijanZulj/blame.nvim",
        event = "VeryLazy",
        config = function()
            require("blame").setup()
        end
    },
    "https://github.com/tpope/vim-fugitive"

}
