function gru --wraps='git remote update' --description 'alias gru=git remote update'
  git remote update $argv; 
end
