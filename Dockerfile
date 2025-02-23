FROM alpine:3.21.3

ENV PATH="/opt/scripts/:${PATH}"
ENV USERLOG=/etc/samba/smbusers
ENV GROUPLOG=/etc/samba/smbgroups
ENV GROUPMEMEBERLOG=/etc/samba/smbgroupmembers

COPY    smb.conf /etc/samba/smb.conf
COPY    --chown=root scripts/ /opt/scripts

RUN     apk add --no-cache tini samba-server samba-common-tools \
        && mkdir -p /media/storage  \
        && chmod -R 755 /media \
        && chmod -R 700 /opt/scripts/ \
        && ln -s /opt/scripts/create_user.sh /opt/scripts/create_user \
        && ln -s /opt/scripts/create_group.sh /opt/scripts/create_group \
        && ln -s /opt/scripts/create_group_membership.sh /opt/scripts/create_group_membership 
        
EXPOSE 139 445
VOLUME ["/etc/samba/"]
ENTRYPOINT ["/sbin/tini","--","/opt/scripts/samba_start.sh"]

CMD []
         