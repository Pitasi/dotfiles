# Defined in - @ line 1
function pull-master --wraps='git switch master && git pull && git switch -' --description 'alias pull-master=git switch master && git pull && git switch -'
  git switch master && git pull && git switch - $argv;
end
