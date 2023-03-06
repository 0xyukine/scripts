for file in *
do
	if [ "$file" != $(basename "$BASH_SOURCE") ]
	then
		ext=${file##*.}
		md5=($(md5sum "$file"))
		mv "$file" "${md5}.${ext}"
	fi
done
