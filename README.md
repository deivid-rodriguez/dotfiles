# My dotfiles

## Setup development machine

Install [ansible] >= 2.3 and run

```bash
ansible-playbook -i hosts machine.yml --ask-become-pass
```


## Install dotfiles

```
source bootstrap.sh
```

[ansible]: https://docs.ansible.com/ansible/index.html
