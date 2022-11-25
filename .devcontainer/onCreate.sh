#!/bin/bash
set -ex

cp $HOME/id_rsa $HOME/.ssh/

if [ ! -f /usr/local/bin/git-mreq ]; then
    sudo curl -o /usr/local/bin/git-mreq \
        --header "PRIVATE-TOKEN: WDgVsGaSPfmXyvmaYqGi" \
        "https://git.fastonetech.com:8443/api/v4/projects/336/repository/files/git-mreq/raw"

    sudo chmod a+x /usr/local/bin/git-mreq
fi

mkdir -p $HOME/.ssh/
cat > $HOME/.ssh/config <<__EOF__
Host git.fastonetech.com:8443
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
    ServerAliveInterval 60
    ServerAliveCountMax 10
__EOF__