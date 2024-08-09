#!/bin/bash     //shebang, yang menunjukkan bahwa skrip ini harus dijalankan menggunakan Bash shell. 

# Tentukan path ke profil Firefox (sesuaikan jika perlu)
FIREFOX_PROFILE_PATH="$HOME/.mozilla/firefox/*.default-release"
USER_JS_PATH="$FIREFOX_PROFILE_PATH/user.js"

# Membuat atau menimpa file user.js untuk mengaktifkan proxy
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
