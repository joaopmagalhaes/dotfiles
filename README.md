# dotfiles

## How to install

Install `curl`:

`sudo apt install curl`

Then, run the `install.sh` on your terminal:

`curl -L https://raw.githubusercontent.com/joaopmagalhaes/dotfiles/master/install.sh | sh`

Finally, run:

`chsh -s /bin/zsh` (couldn't find a way to add this to the script)

Don't forget to generate SSH keys for GitHub, download VPN profile and Chrome certificates

`ssh-keygen -t rsa -C "your_email@youremail.com"`
