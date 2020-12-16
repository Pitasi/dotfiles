function fxrb
git commit --fixup $argv[1]
and git rebase --autosquash -i $argv[1]^
end
