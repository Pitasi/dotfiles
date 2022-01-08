function rb --wraps='git rebase --interactive --autosquash' --description 'alias rb=git rebase --interactive --autosquash'
  git rebase --interactive --autostash --autosquash $argv; 
end
