#!/bin/sh

# Figure out script dir for correct path to includes

script_dir="$(cd "$(dirname "$0")" && pwd)"

#Includes
. ${script_dir}/lib/groups.lib
. ${script_dir}/lib/environment.lib


## Main Program, logic is in imported functions

parse_commandline_group "$@"
add_system_group 
write_group_log
echo "Added Group \"$group_name\" with ID $group_id" 
   


