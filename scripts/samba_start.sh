#!/bin/sh

# Figure out script dir for correct path to includes

script_dir="$(cd "$(dirname "$0")" && pwd)"

#Includes
. ${script_dir}/lib/environment.lib
. ${script_dir}/lib/users.lib
. ${script_dir}/lib/groups.lib
. ${script_dir}/lib/group_members.lib

## Main Program, read existing users, groups and memberships from log ==> Docker does not allow to preserve these naturally
# Passwords are managed securely in smbpasswd

parse_smbgroups 
parse_smbusers
parse_smbgroupmembers

## Start samba server in foreground

smbd --foreground --log-stdout --no-process-group


