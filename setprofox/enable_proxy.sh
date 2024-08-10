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

echo 'Mengaktifkan proxy Burp Suite di Firefox...'
cat <<EOT > $USER_JS_PATH
user_pref("network.proxy.type", 1);
user_pref("network.proxy.http", "127.0.0.1");
user_pref("network.proxy.http_port", 8080);
user_pref("network.proxy.ssl", "127.0.0.1");
user_pref("network.proxy.ssl_port", 8080);
user_pref("network.proxy.no_proxies_on", "localhost, 127.0.0.1");
EOT

echo 'Proxy Burp Suite telah diaktifkan.'
