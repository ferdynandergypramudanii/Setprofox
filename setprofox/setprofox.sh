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

enable_proxy() {
    echo '[-] Enabling Burp Suite proxy in Firefox...'
    cat <<EOT > $USER_JS_PATH
user_pref("network.proxy.type", 1);
user_pref("network.proxy.http", "127.0.0.1");
user_pref("network.proxy.http_port", 8080);
user_pref("network.proxy.ssl", "127.0.0.1");
user_pref("network.proxy.ssl_port", 8080);
user_pref("network.proxy.no_proxies_on", "localhost, 127.0.0.1");
EOT
    echo '[-] Burp Suite proxy has been enabled'
}

disable_proxy() {
    echo '[-] Disabling proxy in Firefox...'
    cat <<EOT > $USER_JS_PATH
user_pref("network.proxy.type", 0);
EOT
    echo '[-] Burp Suite proxy has been disabled'
}

show_help() {
    echo "Usage: setprofox [commands]"
    echo ""
    echo "Commands:"
    echo "  enable    Enabling Burp Suite proxy in Firefox"
    echo "  disable   Disable Burp Suite proxy in Firefox"
    echo "  help      Showing help"
}

case "$1" in
    enable)
        enable_proxy
        ;;
    disable)
        disable_proxy
        ;;
    help)
        show_help
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        exit 1
        ;;
esac