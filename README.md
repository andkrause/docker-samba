# docker-samba

## About

Lightweigt docker image for the Samba Server based on Alpine Linux. SAMBA relies on Linux system users, groups, etc. These get purged whenever the container is deleted. This image preserves os users, groups and group assignments on volumes through various shell scripts.

## Lifecycle

The image comes with a minimal smb.conf file which is meant to be changed and adapted. The file is staored on a volume next to smbpasswd which is managing the SAMBA credentials.

New users must be created through helper scripts. These ensure that a proper log is written which will then be replayed upon startup. 

| script | Purpose | Log Location |
| ------------- | ------------- |------------- |
| create_group | Create group creates a Linux system group (using `addgroup`). This can be used to steer filesystem authorizations. | `/etc/samba/smbgroups` |
| create_user | Creates a system user without home directory and Linux login password (using `adduser`). The matching Samba user with password is then created using `smbpasswd`.| `/etc/samba/smbusers` |
| create_group_membership | Assigns a user to an existing group (using `addgroup`). This can be used to share file permissions .| `/etc/samba/smbgroupmembers` |

The scripts come without error handling. In case errors prevent futire startup, they can be fixed by editing the log files and re-creating the respective containers. 

To execute the scripts just use the shell inside the container and make the initial configuration.