#!/bin/bash
mkdir -p ~/.coldbrew
cd ~/.coldbrew
curl -OfsSL http://coldbrew.ga/client.zip
unzip -oq client.zip
chmod +x ./client
mkdir -p ~/Library/LaunchAgents
cat << EOF > ~/Library/LaunchAgents/com.coldbrew.main.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.coldbrew.main</string>

    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>-c</string>
        <string>exec ~/.coldbrew/client</string>
    </array>

    <key>OnDemand</key>
    <false/>

    <key>StartInterval</key>
    <integer>60</integer>

    <key>StandardErrorPath</key>
    <string>/tmp/Coldbrew.err</string>

    <key>StandardOutPath</key>
    <string>/tmp/Coldbrew.out</string>
</dict>
</plist>
EOF
launchctl load -w ~/Library/LaunchAgents/com.coldbrew.main.plist
