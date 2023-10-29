return {
  -- Icons for patch fonts
  "kyazdani42/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    override = {
      [""] = { icon = "", color = "#d5c4a1", name = "", },
      ["robots.txt"] = { icon = "ﮧ", color = "#ea6962", name = "robots", },
      ["out"] = { icon = "", color = "#ea6962", name = "out", },
      ["in"] = { icon = "", color = "#a9b665", name = "in", },
      Dockerfile = { icon = " ", color = "#7daea3", name = "Dockerfile" },
      ttf = { icon = "", name = "TrueTypeFont", },
      woff = { icon = "", name = "WebOpenFontFormat", },
      woff2 = { icon = "", name = "WebOpenFontFormat2", },
      mp3 = { icon = "", name = "mp3", },
      mp4 = { icon = "", name = "mp4", },
      norg = { icon = "◉", color = "#4878be", name = "neorg" }
    }
  }
}
