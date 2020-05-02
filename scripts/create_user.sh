#!/bin/sh

# Figure out script dir for correct path to includes

script_dir="$(cd "$(dirname "$0")" && pwd)"

#Includes
. ${script_dir}/lib/users.lib
. ${script_dir}/lib/environment.lib


## Main Program, decide on routines based on calling symlink

parse_commandline_user "$@"
add_system_user
add_samba_user
write_user_log
echo "Added User \"$user_name\" with ID $user_id and group \"$group_name\"" 
   


