#
# Regular cron jobs for the deb-release package
#
0 4	* * *	root	[ -x /usr/bin/deb-release_maintenance ] && /usr/bin/deb-release_maintenance
