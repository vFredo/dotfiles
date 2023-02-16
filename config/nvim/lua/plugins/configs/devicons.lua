local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
  vim.notify("Couldn't find devicons " .. devicons .. "\n")
end

devicons.setup {
  override = {
    [""] = { icon = "", color = "#d5c4a1", name = "", },
    ["robots.txt"] = { icon = "ﮧ", color = "#ea6962", name = "robots", },
    ["out"] = { icon = "", color = "#ea6962", name = "out", },
    [ "in" ] = { icon = "", color = "#a9b665", name = "in", },
    LICENSE = { icon = '', color = '#f1f1f1', name = 'license' },
    Dockerfile = { icon = "", color = "#7daea3", name = "Dockerfile", },
    js = { icon = "", color = "#FFC745", name = "js" },
    ts = { icon = "ﯤ", color = "#2E6379", name = "ts", },
    jsx = { icon = '', color = '#689fb6', name = 'jsx' },
    html = { icon = "", color = "#ea6962", name = "html", },
    css = { icon = '', color = '#689fb6', name = 'css' },
    png = { icon = '', color = '#d4843e', name = 'png' },
    jpg = { icon = '', color = '#16a085', name = 'jpg' },
    svg = { icon = '', color = '#3affdb', name = 'svg' },
    ttf = { icon = "", name = "TrueTypeFont", },
    woff = { icon = "", name = "WebOpenFontFormat", },
    woff2 = { icon = "", name = "WebOpenFontFormat2", },
    mp3 = { icon = "", name = "mp3", },
    mp4 = { icon = "", name = "mp4", },
  }
}
