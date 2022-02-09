local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
  error("Couldn't find devicons " .. devicons .. "\n")
end

devicons.setup {
  override = {
    [""] = {
      icon = "",
      color = "#d5c4a1",
      name = "",
    },
    out = {
      icon = "",
      color = "#ea6962",
      name = "output",
    },
    input = {
      icon = "",
      color = "#a9b665",
      name = "input",
    },
    ["robots.txt"] = {
      icon = "ﮧ",
      color = "#ea6962",
      name = "robots",
    },
    Dockerfile = {
      icon = "",
      color = "#7daea3",
      name = "Dockerfile",
    },
    js = {
      name = "js",
      icon = "",
      color = "#FFC745"
    },
    ts = {
      icon = "ﯤ",
      color = "#2E6379",
      name = "ts",
    },
    html = {
      icon = "",
      color = "#ea6962",
      name = "html",
    },
    css = {
      icon = "",
      color = "#93869b",
      name = "css",
    },
  }
}
