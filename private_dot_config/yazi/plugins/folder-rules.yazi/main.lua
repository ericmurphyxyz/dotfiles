local function setup()
  ps.sub("ind-sort", function(opt)
    local cwd = tostring(cx.active.current.cwd)

    if cwd:find("Downloads$") or cwd:find("Screenshots$") then
      opt.by, opt.reverse, opt.dir_first = "mtime", true, false
    else
      opt.by, opt.reverse, opt.dir_first = "natural", false, true
    end

    return opt
  end)
end

return { setup = setup }
