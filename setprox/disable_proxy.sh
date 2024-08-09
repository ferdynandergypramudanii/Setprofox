#!/bin/bash

# Tentukan path ke profil Firefox (sesuaikan jika perlu)
FIREFOX_PROFILE_PATH="$HOME/.mozilla/firefox/*.default-release"
USER_JS_PATH="$FIREFOX_PROFILE_PATH/user.js"

# Membuat atau menimpa file user.js untuk menonaktifkan proxy
echo 'Menonaktifkan proxy di Firefox...'
cat <<EOT > $USER_JS_PATH
user_pref("network.proxy.type", 0);
EOT

echo 'Proxy Burp Suite telah dinonaktifkan.'
