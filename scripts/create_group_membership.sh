#!/bin/sh

# Figure out script dir for correct path to includes

script_dir="$(cd "$(dirname "$0")" && pwd)"

#Includes
. ${script_dir}/lib/group_members.lib
. ${script_dir}/lib/environment.lib


## Main Program, logic is in imported functions

parse_commandline_user_to_group "$@"
add_user_to_group 
write_user_to_group_log
echo "Added user \"$user_name\" to group \"$group_name\""
   


