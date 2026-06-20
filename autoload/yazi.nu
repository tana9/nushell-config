def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	try {
		yazi ...$args --cwd-file $tmp
		let cwd = (open $tmp | str trim)
		if $cwd != "" and $cwd != $env.PWD {
			cd $cwd
		}
	}
	rm --permanent $tmp
}
