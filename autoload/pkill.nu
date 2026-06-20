def pkill [name: string, --force (-f)] {
    let escaped = ($name | str replace --all --regex '[.+*?^${}()|[\]\\]' '\$0')
    let matches = ps | where name =~ $"(?i)($escaped)"
    if ($matches | is-empty) {
        print $"No processes matched: ($name)"
        return
    }
    $matches | select pid name | print
    if not $force {
        let ans = (input "Kill these processes? [y/N] ")
        if $ans != "y" { return }
    }
    for p in $matches {
        print $"Killing ($p.name) (pid ($p.pid))"
        kill $p.pid
    }
}
