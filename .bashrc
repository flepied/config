# ~/.bashrc: executed by bash(1) for non-login shells.

# execute system wide configuration
if [ -r $HOME/config/bashrc ]; then
    . $HOME/config/bashrc
fi

# interactive session
if [ -n "$PS1" ]
then

    if [ "$TERM" = xterm-debian ] && type xterm-name > /dev/null 2>&1
    then
	cd () {
	builtin cd $*
	xterm-name $HOSTNAME:$PWD
	}
	
	pushd () {
	    builtin pushd $*
	    xterm-name $HOSTNAME:$PWD
	}
    
	popd () {
	    builtin pushd $*
	    xterm-name $HOSTNAME:$PWD
        }
	# suppress the /export path and set xterm title
	cd `echo $PWD|sed -e 's%/export%%'`
    fi
fi

# .bashrc ends here
