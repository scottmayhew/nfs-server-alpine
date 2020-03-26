FROM fedora:latest

RUN dnf -y install nfs-utils iproute procps-ng sssd-client \
    sssd-krb5-common sudo libsss_idmap libsss_nss_idmap libsss_sudo \
    sssd-common krb5-workstation krb5-libs && dnf clean all

COPY exports /etc/
COPY nfsd.sh /usr/bin/nfsd.sh

RUN chmod +x /usr/bin/nfsd.sh

EXPOSE 2049

ENTRYPOINT ["/usr/bin/nfsd.sh"]
