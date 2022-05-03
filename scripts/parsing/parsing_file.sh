#!/usr/bin/env bash

set -e

optn=$1
usersfile=$2

# Accept an argument --filename or -f
case $1 in
    -f|--filename);;
        *)
	echo "You don't have an atribute"
	exit 1
esac

# Finishing execution, if the command returns an error
if [ -z "$usersfile" ]; then
    echo "Unspecified path"
    exit 1
fi

# Checking the file type
if [[ "$usersfile" != *.csv ]]; then
    echo "File type is not .csv"
    exit 1
fi

# Reading the .csv file
while IFS=, read -r colum1 colum2 colum3 colum4
   do
       uname_array+=("$colum1")
       cutout=`echo $colum2 | cut -c1-1`

       # Create a random password
       password=$(echo $RANDOM | md5sum | head -c 8; echo)

       # Encrypted password with perl crypt
       upasswd=$(perl -e 'print crypt($ARGV[0], "password")' "$password")

       # Add user with password
       useradd -m -p "$upasswd" "$colum1"

       # Create information for output
       output_inf=$(date '+%d::%m::%y:%H:%M')
       output_inf+=" $colum1 was created and add to following group"

       g_colum2=$(echo "$colum2" | tr -cd '[:alnum:]._-')
       g_colum3=$(echo "$colum3" | tr -cd '[:alnum:]._-')

       # Create the users dir and add users
       if [[ "$cutout" == '"' ]]; then
            ugroups_array+=("$colum2, $colum3");
            groupadd -f "$g_colum2"
	        groupadd -f "$g_colum3"
	        usermod -a -G "$g_colum2" "$colum1"
            usermod -a -G "$g_colum3" "$colum1"
	        output_inf+=" $g_colum2 $g_colum3"
       else
 	        user_groups_array+=("$colum2");
	        groupadd -f "$colum2"
            usermod -a -G "$colum2" "$colum1"
	        output_inf+=" $g_colum2"
       fi

       # Output on stdout [INFO]
       echo "$output_inf"

done < <(grep "" $usersfile)