#!/usr/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
        [[ `basename $f` == ".git" || `basename $f` == ".bin"* ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        for f in $dotdir/linux/.??*; do
            if [[ -L "$HOME/`basename $f`" ]];then
                command rm -f "$HOME/`basename $f`"
            fi
            if [[ -e "$HOME/`basename $f`" ]];then
                command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
            command ln -snf $f $HOME
        done
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        for f in $dotdir/darwin/.??*; do
            if [[ -L "$HOME/`basename $f`" ]];then
                command rm -f "$HOME/`basename $f`"
            fi
            if [[ -e "$HOME/`basename $f`" ]];then
                command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
            command ln -snf $f $HOME
        done
    fi
else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
command echo -e "\e[1;36m completed. \e[m"
