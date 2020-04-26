#!/bin/env fish

# xdg-break
# Script that sends a notification to remind you to take a break.

set basename (basename (status -f))
set config
set interval

function usage
	echo "Usage:"
	echo "$basename [OPTION...]"
	echo ""
	echo "Help Options:"
	echo "	-h, --help	Show help options"
	echo "	-V, --version	Print version information and exit"
	echo "	-q, --quit	Quit any running instances of $basename"
	echo ""
	echo "Interval for each notification is stored in \$XDG_CONFIG_HOME/xdg-break/interval"
	echo ""
end

function version
	echo "$basename 0.0.1"
end

for item in $argv
	switch $item
		case "-h" "--help"
			usage
			exit 0
		case "-V" "--version"
			version
			exit 0
		case "-q" "--quit"
			set pid (ps -aux | grep xdg-break | grep fish | awk '{print $2}' | head -1)
			if test $status -eq 1
				echo "$basename: no running instances found"
				exit 1
			else
				kill $pid
				if test $status -eq 1
					echo "$basename: unable to quit running instance"
					exit 1
				else
					exit 0
				end
			end
	end
end

if test "$XDG_CONFIG_HOME" = ""
	set config "$HOME/.config/xdg-break"
	echo "$basename: \$XDG_CONFIG_HOME not defined, using $HOME/.config"
else
	set config "$XDG_CONFIG_HOME/xdg-break"
end

set config_file $config/interval

if ! test -d $config
	mkdir -p $config
	echo "$basename: configuration directory does not exist. creating $config"
end

if ! test -f $config_file
	touch $config_file
	echo "set interval 3600" > $config_file
	echo "$basename: configuration file does not exist. creating $config_file with default interval 3600"
end

source $config_file

while true
	sleep $interval
	notify-send --expire-time=10000 --urgency=critical "$basename" "Please take a break"
end

exit 0
