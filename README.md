# sshprep

A bash function to prepare a host for an ssh session by scp'ing handy files like dotfiles from the local machine to the host.

## Usage

### Setup
Put sshprep.sh on the local system somewhere such as `~/.sshprep.sh`.

In `~/.bashrc`, configure the files to scp and source sshprep:

```bash
if [ -f "$HOME/.sshprep.sh" ]; then
  declare -a sshprep_files=(
    "$HOME/.bashrc"
    "$HOME/.screenrc"
    "$HOME/.vimrc"
  )
  . "$HOME/.sshprep.sh"
fi
```

### Run

To prepare and then connect to a host with the IP address 10.1.2.3:

```bash
$ sshprep 10.1.2.3
```
