def --env y [...args] {
  let tmp = ($env.TEMP | path join $"yazi-cwd-(random chars -l 8).tmp")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp | str trim)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -f $tmp
}
