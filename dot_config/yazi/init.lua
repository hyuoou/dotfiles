require("full-border"):setup()

function Header:cwd()
  local cwd = cx.active.current.cwd
  return ui.Span(tostring(cwd)):fg("blue"):bold()
end
