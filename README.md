# pfanchors

## NAME
pfanchors - control the packet filter (PF) anchors

## SYNOPSIS
pfanchors [show|load|flush] anchor 
          [list] [help] [version]

## DESCRIPTION
The pfanchors utility uses pfctl(8) to control and manage the
packet filter (PF) anchors.

pfanchors(8) implies that anchor config files are conventionally
named pf-$anchor.conf and stored in /etc/pf/. Feel free to modify
the variable $confdir to fit your needs.

At least one option must be specified. the options are as follow:

	show anchor
		Show all filter rules inside the anchor ``anchor''

	load anchor
		Load filter rules inside the anchor ``anchor''
		(default: stored inside /etc/pf-anchor.conf)

	flush anchor
		Flush all filter rules inside the anchor ``anchor''

	list
		List all anchors and their status

## SEE ALSO
pf(4), pf.conf(5), pf.os(5), pfctl(8)

