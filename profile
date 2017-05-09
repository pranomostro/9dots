bind -a $home/bin/rc /bin
bind -a $home/bin/$cputype /bin
bind -a $home/bin/awk /bin
bind -c $home/tmp /tmp

font=/lib/font/bit/pelm/euro.9.font

#configure the network on startup without delaying startup.
{ ip/ipconfig; ndb/dns -r }&

cat $home/proj/begun/neo/neo2 >/dev/kbmap

switch($service){
case terminal
	plumber
	upas/fs
	echo -n accelerated > '#m/mousectl'
	echo -n 'res 3' > '#m/mousectl'
	prompt='; '
exec rio
case cpu
	if(test -e /mnt/term/mnt/wsys){
		bind -a /mnt/-erm/mnt/wsys /dev
		if(test -w /dev/label)
			echo -n $sysname >/dev/label
	}
	bind /mnt/term/dev/cons /dev/cons
	bind /mnt/term/dev/consctl /dev/consctl
	bind -a /mnt/term/dev /dev
	prompt='≡ '
	news
	if(! test -e /mnt/term/mnt/wsys){
		font/lib/font/bit/pelm/latin1.8.font
		exec rio
	}
case con
	prompt='= '
	news
}
