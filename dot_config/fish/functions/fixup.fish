function fixup --wraps='git commit --fixup' --description 'alias fixup=git commit --fixup'
  git commit --fixup $argv; 
end
