// For more information on customizing Oni,
// check out our wiki page:
// https://github.com/extr0py/oni/wiki/Configuration

const activate = (oni) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
  activate,
  deactivate,
  //add custom config here, such as
  "oni.useDefaultConfig": false, // default is true
  "oni.loadInitVim": true,
  //"oni.bookmarks": ["~/Documents",]
  // "oni.statusbar.enabled": false, // yes by default
  "oni.useExternalPopupmenu": true,
  "statusbar.enabled": true, // yes by default
  "statusbar.fontSize": "15px", // yes by default
  //
  "editor.fontSize": "18px",
  // "ui.colorscheme":"one",
  // "ui.colorscheme":"gruvbox",
  // "ui.colorscheme":"flat",
  // "ui.colorscheme":"dracula",
  // "ui.colorscheme":"onedark",
  // "ui.colorscheme":"deus",
  "ui.fontFamily": "Ubuntu",
  // "editor.fontFamily": "'Ubuntu Mono', monospace",
  "editor.fontFamily": "Ubuntu Mono",
  // "editor.fontFamily": "TeX Gyre",
  // "editor.fontFamily": "Fira Code"
  // "editor.fontFamily": "Ubuntu"
  // "editor.fontSize": "15px",
  //  "editor.fontFamily": "Fira Mono for Powerline",
  // "editor.fontFamily": "Droid Sans Mono Dotted for Powerline",
  // "editor.fontFamily": "Consolas"
  //  "editor.fontFamily": "Ayuthaya"
  // "editor.fontFamily": "Ubuntu Mono derivative Powerline Regular",
  // "editor.fontFamily": "Source Code Pro",
  // "editor.fullScreenOnStart": true,
  // "editor.backgroundOpacity": 0.5,
  //
  //"editor.fontFamily": "Monaco"
}

