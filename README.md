A.N.T - Development and Deployment Made Easy

A.N.T is an automation tool built out of a painful reality — the dreaded "It works on my computer" problem. Different environments, tool versions, OS configurations, and project structures lead to failed deployments, broken apps, and wasted time.

A.N.T fills the gap.
With one click, A.N.T provides the exact same OS environment, development tools, and deployment settings across every team member's system. No more inconsistencies. No more surprises.

Key Features

1.  `init + sync + update + docker`

One command to:

- Clone the GitHub repo
- Install all required tools and dependencies
- Sync dotfiles and environment configurations
- Update your system automatically with latest GitHub changes
- Deploy your app locally with Docker

2.  Ansible Automation

- Automatically create connections to teammates’ machines
- Deploy configurations, apps, and more using sample Ansible playbook templates

3.  Health Monitor

- Analyze system health
- Identify processes causing lag
- Restart misbehaving services automatically
- Get notified instantly

4.  Code Local, See Global

- Make code changes in local VS Code
- Automatically reflect them inside Docker container

---

Installation Guide

🧑 Team Lead Responsibilities

Upload the following to the GitHub repository:

````
Project-name/
├── Docker/
│   ├── code/
│   ├── Dockerfile
│   └── service.yml
├── Scripts/
│   ├── init.sh
│   ├── sync.sh
│   ├── update.sh
│   ├── monitor.sh
│   └── ansible_automation.sh
└── Dotfile/
    ├── .bashrc
    └── .vimrc



⚡ Quick Start

Option A: If Environment Exists

1. Open your Linux terminal
2. Navigate to the `scripts` folder:

   ```bash
   cd /your_project_name/scripts
   ./init.sh
````

3. Navigate to Docker folder:

   ```bash
   cd /your_project_name/docker
   docker compose -f service.yml up --build
   ```

Option B: If No Environment Exists

1. Create a folder for your project
2. Add the `Vagrantfile` provided
3. Open Git Bash and run:

   ```bash
   cd your_project_folder
   vagrant up
   vagrant ssh
   ```

---

Local VS Code Syncing

1. Open VS Code
2. Install extension: Remote - SSH
3. Connect to remote machine:

   - Use your machine's username and IP address
   - To fetch them:

     ```bash
     adduser your_name
     ip addr
     ```

---

Script Usage

`./init.sh`

- Clones GitHub repo
- Installs tools and dependencies
- Sets up Docker with code

`./sync.sh`

- Syncs your system's OS environment
- Applies `.bashrc`, `.vimrc`, and other dotfiles
- Creates a backup automatically

`./update.sh`

- Pulls latest GitHub changes
- Rebuilds and updates Docker setup

`./ansible_automation.sh`

- Connects to remote servers
- Use the following:

  ```bash
  cd /etc/ansible
  vi hosts
  ```

  - Add under `[webserver]`:

    ```
    target_ip_address ansible_user=target_username
    ```

`./monitor.sh` (Health.sh)

- Runs system health checks every minute
- Automatically restarts services using too many resources
- Sends system notifications

---

Docker & Services Overview

`Dockerfile`

- Installs necessary runtimes (Node.js, Python, Flutter, etc.)
- Sets up working directory
- Copies project files into container
- Defines container behavior

`service.yml`

- Combines services (Node.js, MongoDB, Redis, etc.)
- Supports volumes for dynamic development
- Makes local VS Code changes reflect in the Docker container

---

Requirements

- Run all commands only in CentOS 9
- Bash must be available

---

> A.N.T ensures your entire team shares the same environment, removing setup inconsistencies. It’s automation, the way it should be — effortless, powerful, and reliable.

