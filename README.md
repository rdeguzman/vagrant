# Ubuntu Vagrant

## Contributing Notes

- See .localrc to update system wide environment variables.
- Working folders from OSX Host synced to /var/www.

## Setup

	# git clone git@bitbucket.org:rdeguzman/vagrant.git

	# vim settings.yml
	cpus: "2"
	memory: "2048"
	project_directory: "/Projects"

## Provisioning

	# vagrant up --provision

## Vagrant Commands

	# vagrant up
	# vagrant ssh
	# vagrant halt

## Packages

- postgresql-10
- postgis2.4
- rbenv
- nvm

### Postgres
	vagrant@dbox:/var/www$ psql -h 127.0.0.1 -U postgres postgres
	psql (10.4 (Ubuntu 10.4-2.pgdg16.04+1))
	SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
	Type "help" for help.

	postgres=#
