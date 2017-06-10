# My dotfiles

## Setup development machine

The following has only been tested on Linux Mint 18.1, but it should work on any
Ubuntu-like distribution.

Install [ansible] >= 2.3 and run

```bash
ansible-playbook -i hosts machine.yml --ask-become-pass
```

## Install dotfiles

```
source bootstrap.sh
```

[ansible]: https://docs.ansible.com/ansible/index.html
