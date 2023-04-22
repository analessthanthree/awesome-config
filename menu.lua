-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

local rcmenu = {}

-- Create a launcher widget and a main menu
rcmenu.myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", gn.terminal .. " -e man awesome" },
   { "edit config", gn.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

rcmenu.menu_awesome = { "awesome", rcmenu.myawesomemenu, beautiful.awesome_icon }
rcmenu.menu_terminal = { "open terminal", gn.terminal }

rcmenu.mymainmenu = {}

if has_fdo then
    rcmenu.mymainmenu = freedesktop.menu.build({
        before = { rcmenu.menu_awesome },
        after =  { rcmenu.menu_terminal }
    })
else
    rcmenu.mymainmenu = awful.menu({
        items = {
                  rcmenu.menu_awesome,
                  { "Debian", debian.menu.Debian_menu.Debian },
                  rcmenu.menu_terminal,
                }
    })
end


rcmenu.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = rcmenu.mymainmenu })

-- Menubar configuration
menubar.utils.terminal = gn.terminal -- Set the terminal for applications that require it

return rcmenu
