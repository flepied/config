# commands common to all logins -*- shell-script -*-


export GOPATH=~/gopath/
export GOBIN="${GOPATH}bin/"

# DCI specific
if [ -r "$HOME/work/dci-ansible/dev-ansible.cfg" ]; then
    export ANSIBLE_CONFIG="$HOME/work/dci-ansible/dev-ansible.cfg"
fi

if [ "$SHLVL" = 1 ]; then

    if type -p claude >& /dev/null; then
        export CLAUDE_CODE_USE_VERTEX=1
        export CLOUD_ML_REGION=global
        export ANTHROPIC_VERTEX_PROJECT_ID=itpc-gcp-eco-eng-claude
    fi

    if type gemini >& /dev/null; then
        export GOOGLE_CLOUD_PROJECT=dci-mcp-server-471716
    fi

    #export http_proxy=${http_proxy-http://proxywww:8080/}
    export MINICOM=${MINICOM-"-c on"}
    export HOSTNAME=${HOSTNAME-"`uname -n`"}
    export PGPPATH=${PGPPATH-${HOME}/.pgpkeys}
    export NNTPSERVER=${NNTPSERVER-news}
    export IRCSERVER=${IRCSERVER-24.6.229.74}
    #export PRINTER=${PRINTER-EpsonAcculaser2000}
    #export PRINTER=${PRINTER-printer@192.168.100.3}
    #export PRINTER=${PRINTER-printer}
    export SMTPSERVER=${SMTPSERVER-extmailfr}
    export RPM=${RPM=$HOME/RPM}
    export SIMPLE_BACKUP_SUFFIX=${SIMPLE_BACKUP_SUFFIX=.fred}
    export CVS_RSH=ssh
    #export PIP_DOWNLOAD_CACHE=$HOME/.cache/pip_download_cache
    #mkdir -p $PIP_DOWNLOAD_CACHE
    

    PATH=
    for d in $HOME/.radicle/bin $HOME/pkg/zig-linux-x86_64-0.11.0-dev.1905+e3cf9d165 $HOME/private/bin $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/pkg/balena-cli $GOBIN /usr/local/sbin /usr/local/bin /usr/X11R6/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games .; do
	if [ -d $d ]; then
	    if [ -z "$PATH" ]; then
		PATH=$d
	    else	
		PATH=$PATH:$d
	    fi
	fi
    done

    # setup bash completion direrctory unde ~/.local/share/bash-completion/
    if [ -d $HOME/.local/share/bash-completion/ ]; then
        export BASH_COMPLETION_DIR=$HOME/.local/share/bash-completion

        for comp in $(ls $HOME/.local/share/bash-completion/*); do
            source $comp
        done
    fi


#     if type -p difft >& /dev/null; then
#         export GIT_EXTERNAL_DIFF=difft
#     fi

    LESS=-MM

    umask 022

    # Intel compiler
    dir=/opt/intel/cce/`ls /opt/intel/cce/ 2>/dev/null |tail -1`

    if [ -r $dir/bin/iccvars.sh ]; then
	. $dir/bin/iccvars.sh
    fi

    # Intel IPP
    dir=/opt/intel/ipp/`ls /opt/intel/ipp/ 2> /dev/null|tail -1`
    
    if [ -r $dir/em64t/tools/env/ippvarsem64t.sh ]; then
	#echo "Sourcing IPP vars with $dir/em64t/tools/env/ippvarsem64t.sh"
	. $dir/em64t/tools/env/ippvarsem64t.sh
    fi
    
    # Intel Thread profiler
    case `uname -m` in
	i*86) a=32;;
	x86_64) a=32e;;
    esac
    
    if [ -r /opt/intel/itt/tprofile/bin/$a/tprofilevars.sh ]; then
	. /opt/intel/itt/tprofile/bin/$a/tprofilevars.sh
    fi

    # source system proxy vars
    if [ -r /etc/profile.d/proxy.sh ]; then
	. /etc/profile.d/proxy.sh
    fi
fi

if [ -n "$PS1" ]
then
    if [ -r $HOME/external/liquidprompt/liquidprompt ]; then
       . $HOME/external/liquidprompt/liquidprompt
    fi
    if [ -r $HOME/config/git-completion.bash ]; then
        . $HOME/config/git-completion.bash
    fi
    if [ "$SHELL" = "/bin/pdksh" ]; then
	PS1="! $ "
    fi
    if [ -d ~/work/distributedci/dci-openshift-agent ]; then
        alias doa='cd ~/work/distributedci/dci-openshift-agent/'
    fi
    if [ -d ~/work/distributedci/dci-openshift-app-agent ]; then
        alias doaa='cd ~/work/distributedci/dci-openshift-app-agent/'
    fi
    if [ -d ~/work/ai-assist ]; then
        alias nexus='~/work/ai-assist/.venv/bin/ai-assist'
        alias iris='AI_ASSIST_REPORTS_DIR=~/iris AI_ASSIST_CONFIG_DIR=~/.iris ~/work/ai-assist/.venv/bin/ai-assist'
        # Agent Under Test 2 (ai-assist-branch2)
        alias aut2='AI_ASSIST_REPORTS_DIR=~/aut2 AI_ASSIST_CONFIG_DIR=~/.aut2 ~/work/ai-assist-branch2/.venv/bin/ai-assist'
        alias gizmo='AI_ASSIST_REPORTS_DIR=~/aut2 AI_ASSIST_CONFIG_DIR=~/.aut2 ~/work/ai-assist-branch2/.venv/bin/ai-assist'
    fi
    alias j='jobs'
    alias lc='ls -F'
    alias la='ls -a'
    alias ll='ls -la'
    alias m=more
    alias l=less
    alias a='source .venv/bin/activate'
    alias d=deactivate
    alias +=pushd
    alias -- -=popd
#    alias \==dirs
    alias h='history'
    alias j='jobs -l'
    alias la='ls -a'
    alias lc='ls -CF'
    alias ll='ls -lg'
    alias lla='ls -la'
    alias psg='ps aucx | grep -Fv fgrep | grep -F '
    alias psh='ps aucx | head -15'
    alias lsh='ls -lt|head'
    alias s='cd ..'
    alias cds='cd ~/RPM/SPECS'
    alias cdo='cd ~/RPM/SOURCES'
    alias cdb='cd ~/RPM/BUILD'
    alias cdw='cd ~/work'
    alias cdp='cd ~/perso'
    alias cde='cd ~/external'
    if [ -d ~/Download ]; then
        alias cdt='cd ~/Download'
    else
        alias cdt='cd ~/Téléchargements'
    fi
    alias cdd='cd ~/work/dci-labs'
    alias cdc='cd ~/work/ansible_collections/redhatci/ocp'
    alias e='emacsclient -n'
    alias gti=git
    alias sshn='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
#
#     alias d="cd ../../Deriv/\`basename \$PWD\`"
#     alias o="cd ../../Orig/\`basename \$PWD\`"
#
    LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:';
    export LS_COLORS;
    LS_OPTIONS='--color=tty';
    export LS_OPTIONS;
    #PAGER=${PAGER-less}
    export PAGER
    alias ls='ls $LS_OPTIONS';
    alias dir='ls $LS_OPTIONS --format=vertical';
    alias vdir='ls $LS_OPTIONS --format=long';
    #alias d=dir;
    alias v=vdir;
    # alias net='term < /dev/modem > /dev/modem 2> /dev/null&'
    # alias startx='startx >& /dev/null'
    alias wz='cd ~/work/wazo-platform'
    ignoreeof=10
    export PS1 PS2 ignoreeof
    if [ -x /usr/games/fortune ]
    then
	    echo
	    /usr/games/fortune
	    echo
    fi
# isatty
fi

#set -x

# ssh stuff
if [ -x $HOME/config/run-ssh ]; then
    . $HOME/config/run-ssh
fi

# bashrc ends here
