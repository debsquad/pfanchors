# pfanchors
pfanchors control the packet filter (PF) anchors

## SYNOPSIS
pfanchors [show|load|flush] anchor 
          [list] [help] [version]

## DESCRIPTION
The pfanchors utility uses pfctl(8) to control and manage the
packet filter (PF) anchors.

pfanchors implies that anchor config files are conventionally
named _pf-$anchor.conf_ and stored in _/etc/pf/_. Feel free to modify
the variable _$confdir_ to fit your needs.

At least one option must be specified. the options are as follow:

	show <anchor>
		Show all filter rules inside the anchor ``anchor''

	load <anchor>
		Load filter rules inside the anchor ``anchor''
		(default: stored inside _/etc/pf-anchor.conf_)

	flush <anchor>
		Flush all filter rules inside the anchor ``anchor''

	list
		List all anchors and their status

## SEE ALSO
pf(4), pf.conf(5), pf.os(5), pfctl(8)

