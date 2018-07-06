# add the zsh functions to the fpath
fpath+="@zsh_out@/zsh/functions"
fpath+="@zsh_out@/zsh/completions"

# load the important functions
source "@zsh_out@/zsh/functions/debug"
source "@zsh_out@/zsh/functions/have"
source "@zsh_out@/zsh/functions/is_func"
source "@zsh_out@/zsh/functions/pathappend"
source "@zsh_out@/zsh/functions/pathprepend"
source "@zsh_out@/zsh/functions/pathunmunge"
source "@zsh_out@/zsh/functions/sp"
source "@zsh_out@/zsh/functions/ssh_agents"

# autoload all of the functions
for func in @zsh_out@/zsh/functions/*; do
  case "$(basename ${func})" in
    debug)       ;;
    have)        ;;
    is_func)     ;;
    pathappend)  ;;
    pathprepend) ;;
    pathunmunge) ;;
    sp)          ;;
    ssh_agents)  ;;
    *)
      local func_name="$(basename ${func})"
      autoload -U "${func_name}"
      ;;
  esac
done
unset func
