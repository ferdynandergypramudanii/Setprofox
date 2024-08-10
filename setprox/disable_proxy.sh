#!/bin/bash

cat <<'EOF'
 ____       _                    __           
/ ___|  ___| |_ _ __  _ __ ___  / _| _____  __
\___ \ / _ \ __| '_ \| '__/ _ \| |_ / _ \ \/ /
 ___) |  __/ |_| |_) | | | (_) |  _| (_) >  < 
|____/ \___|\__| .__/|_|  \___/|_|  \___/_/\_\
               |_|                            
EOF

FIREFOX_PROFILE_PATH="$HOME/.mozilla/firefox/*.default-release"
USER_JS_PATH="$FIREFOX_PROFILE_PATH/user.js"

echo 'Menonaktifkan proxy di Firefox...'
cat <<EOT > $USER_JS_PATH
user_pref("network.proxy.type", 0);
EOT

echo 'Proxy Burp Suite telah dinonaktifkan.'
