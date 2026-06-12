# dragon.yazi

a simple [yazi](https://github.com/sxyazi/yazi) plugin that provides currently-selected files to [dragon](https://github.com/mwh/dragon) for basic
drag-and-drop support.


## features

-   drag files to/from folder


## requirements

-   [yazi](https://github.com/sxyazi/yazi) v25.5.31
-   [dragon](https://github.com/mwh/dragon)


### note

this plugin is currently only built and tested on linux


## installation

    ya pkg add unleashedfurai/dragon


## configuration

add the following to your `keymap.toml`

    [[mgr.prepend_keymap]]
    on = [ "e" ]
    run = "plugin dragon open"
    desc = "open selection for DnD with dragon"

    [[mgr.prepend_keymap]]
    on = [ "E" ]
    run = "plugin dragon target"
    desc = "accept DnD in cwd with dragon"

the default behavior of this plugin invokes dragon's `--and-exit` option

if you would prefer the window to stay open until explicitly closed, the
`open_keep` command does not invoke `--and-exit`
