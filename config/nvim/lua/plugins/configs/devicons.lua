local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
  return
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
      name = "out",
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
      color = "#7daea3",
      name = "ts",
    },
    html = {
      icon = "",
      color = "#dc9656",
      name = "html",
    },
    css = {
      icon = "",
      color = "#93869b",
      name = "css",
    },
  }
}
