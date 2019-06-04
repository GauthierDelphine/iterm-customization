#! /bin/zsh

# load helper function to manipulate hook arrays
autoload -Uz add-zsh-hook

# allow for parameter substitution in prompts
setopt PROMPT_SUBST
# add string `$COLOR` to $PS1. 
# Note the `\` before `${COLOR}`, which prevents immediate evaluation.
# `${COLOR}` will be substituted each time the prompt is printed
PS1="$PS1\${COLOR}"

# define hook function, decide on action based on $PWD, the new pwd.
chback_on_chdir () {
    case $PWD in
        /Volumes/ELAO/workspace/wotol* )
            COLOR='%F{75}'
            ;;

        /Volumes/ELAO/workspace/mjc-ats* )
            COLOR='%F{226}'
            ;;    
        
        * )
            COLOR='%k'
            ;;
    esac
}

# add chback_on_chdir to chpwd_functions
add-zsh-hook chpwd chback_on_chdir