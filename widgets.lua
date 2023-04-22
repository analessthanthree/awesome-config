local widgets = {}

-- Keyboard map indicator and switcher
widgets.mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- function separator_template(s)
--   return wibox.widget {
--     span_ratio = 1,
--     shape = gears.shape.rectangle,
--     color = gears.color.create_solid_pattern(beautiful.separator_color),
--     widget = wibox.widget.separator
--   }
-- end

function widgets.separator_template(s,textBool)
  local text = ""
  if textBool then
    text = "ana &lt;3"
  end
  local textbox = wibox.widget {
    align = 'center',
    valign = 'center',
    markup = text,
    color = gears.color.create_solid_pattern(beautiful.separator_color),
    widget = wibox.widget.textbox
  }
  local background = wibox.container.background(textbox,beautiful.separator_color)
  return background
end

-- Create a textclock widget
widgets.mytextclock = wibox.widget.textclock()

return widgets
