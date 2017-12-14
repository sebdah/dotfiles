function nvm-fast
	set -q NVM_DIR ; or set -l NVM_DIR ~/.nvm
	set -l brigand_nvm_fish_path $NVM_DIR/versions/node
	if test (count $argv[1]) -lt 1
		echo 'nvm-fast: at least one argument is required'
	end

	set -l command $argv[1]
	if test $command = 'use'
		set target_version "unknown"
		if test (count $argv) -eq 1
			if test -f .nvmrc
				set target_version (cat .nvmrc)
			else
				echo "Error: No version provided and no .nvmrc found"
				return
			end
		else
			set target_version $argv[2]
		end
		set -l target_version $target_version

		set -l matched_version (bash -c "source $NVM_DIR/nvm.sh --no-use; nvm_version $target_version")

		if test -z $matched_version -o $matched_version = 'N/A'
			echo "No version installed for $target_version, run nvm install $target_version"
			echo "Installed versions: "
			for file in $brigand_nvm_fish_path/v*
				echo ' -' $file
			end
		else
			set -l new_path
			for path_segment in $fish_user_paths
				if not echo "$path_segment" | grep -q "$brigand_nvm_fish_path"
					set new_path $new_path "$path_segment"
				end
			end
			if test $matched_version != 'system'
				set new_path $brigand_nvm_fish_path/$matched_version/bin $new_path
			end
			set -g fish_user_paths $new_path
		end
	else
		bash -c "source $NVM_DIR/nvm.sh --no-use; nvm $argv"
	end
end

function nvm
	nvm-fast $argv
end

