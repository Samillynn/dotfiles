findall() {
	for dir in $(ls /); do
		if [ "$dir" != "mnt" ]; then
			sudo find "/$dir" -name "$1"
		fi
	done
}

f() {
    # echo $#
	if [ "$#" -eq 1 ]; then
		# echo find -name "$1"
		find -name "$1" 
    else
		# echo find "$1" -name "$2"
		find "$1" -name "$2"
	fi
}

mcd() {
	mkdir -p "$1"
	cd "$1"
}


