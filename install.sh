#!/bin/bash

if [[ ! -d ~/bin ]] ; then
  mkdir ~/bin
fi

cp dial_rds.sh hup_rds.sh remote_shutdown.sh reverse_ssh.sh ~/bin
sudo cp autodial_rds.sh raspi_gpio_actions_INT.py /usr/local/bin
sudo bash -c 'echo "# Added by me" >> /etc/crontab'
sudo bash -c 'echo "@reboot root raspi_gpio_actions_INT.py" >> /etc/crontab'
sudo bash -c 'echo "@reboot root autodial_rds.sh" >> /etc/crontab'
sudo bash -c 'echo "@reboot pi   /home/pi/bin/reverse_ssh.sh" >> /etc/crontab'

sudo bash -c 'echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"12d1\", ATTRS{idProduct}==\"15ca\", RUN+=\"/usr/bin/sg_raw /dev/sr0 11 06 20 00 00 00 00 00 01 00\"" >> /etc/udev/rules.d/10-HuaweiFlashCard.rules' 

echo "You need to edit \"reverse_ssh.sh\" and \"remote_shutdown.sh\" and replace x@x with the actual user@host of ssh server that acts as proxy."
