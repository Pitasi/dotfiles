# Defined in - @ line 1
function rb --wraps='git rebase -i -autosquash' --wraps='git rebase -i --autosquash' --description 'alias rb=git rebase -i --autosquash'
  git rebase -i --autosquash $argv;
end
