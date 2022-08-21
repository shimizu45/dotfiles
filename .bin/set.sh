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
  case $OSTYPE in
      "linux-gnu"*)
          local osdir="linux"
          ;;
      "darwin"*)
          local osdir="darwin"
          ;;
  esac

  if [[ "$HOME" != "$dotdir" ]];then
      for f in $dotdir/.??*; do
          [[ `basename $f` == ".git" || `basename $f` == ".bin" ]] && continue
          if [[ -L "$HOME/`basename $f`" ]];then
              command rm -f "$HOME/`basename $f`"
          fi
          if [[ -e "$HOME/`basename $f`" ]];then
              command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
          fi
          command ln -snf $f $HOME
      done
      for f in `find $dotdir/$osdir/ -type f`; do
          if [[ -L "$HOME${f#$dotdir/$osdir}" ]];then
              command rm -f "$HOME${f#$dotdir/$osdir}"
          elif [[ -e "$HOME${f#$dotdir/$osdir}" ]];then
              command mkdir -p "$HOME/.dotbackup$(dirname ${f#$dotdir/$osdir})"
              command mv "$HOME${f#$dotdir/$osdir}" "$HOME/.dotbackup${f#$dotdir/$osdir}"
          fi
          command mkdir -p "$HOME$(dirname ${f#$dotdir/$osdir})"
          command ln -snf $f $(dirname $HOME${f#$dotdir/$osdir})
      done
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
