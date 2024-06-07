#!/bin/bash

echo "PPPwn"

# Set the firmware version
FW_VERSION="1100"
#ethernet for orange pi
INTERFACE="end0"
# Define the paths for the stage1 and stage2 files based on the firmware version
STAGE1_FILE="stage1/$FW_VERSION/stage1.bin"
STAGE2_FILE="stage2/$FW_VERSION/stage2.bin"

# Create the execution script with the user inputs
cat <<EOL > pppwn_script.sh
#!/bin/bash

# Define variables
FW_VERSION=$FW_VERSION
STAGE1_FILE="$STAGE1_FILE"
STAGE2_FILE="$STAGE2_FILE"

# Disable INTERFACE
ifconfig "$INTERFACE" down

# Wait a second
sleep 1

# Enable INTERFACE
ifconfig "$INTERFACE" up

# Wait a second
sleep 1

# Change to the directory containing the pppwn executable
cd /home/pipc/PPPwn-OrangePi-PC/

# Execute the pppwn command with the desired options
./pppwn --interface "$INTERFACE" --fw \$FW_VERSION --stage1 "\$STAGE1_FILE" --stage2 "\$STAGE2_FILE" -a -t 5 -nw -wap 2

# Check if the pppwn command was successful
if [ \$? -eq 0 ]; then
    echo "pppwn execution completed successfully."
    systemctl stop pppwn.service
    sleep 20
    ifconfig "$INTERFACE" down
    systemctl poweroff
else
    echo "pppwn execution failed. Exiting script."
    exit 1
fi
EOL

# Make the pppwn and script executable
chmod +x pppwn_script.sh
chmod +x pppwn

# Create the pppwn.service file
cat <<EOL > pppwn.service
[Unit]
Description=PPPwn Script Service
After=network.target

[Service]
Type=simple
ExecStart=/home/pipc/PPPwn-OrangePi-PC/pppwn_script.sh
ExecStop=/usr/bin/systemctl poweroff

[Install]
WantedBy=multi-user.target
EOL

# Move and enable the service file
sudo mv pppwn.service /etc/systemd/system/
sudo chmod +x /etc/systemd/system/pppwn.service
sudo systemctl enable pppwn.service

echo "install completed! Rebooting..."

sudo reboot
