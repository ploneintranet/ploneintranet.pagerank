PROJECT=ploneintranet.pagerank
default: devel

# requires prefixing commands with sudo. But you can change that:
# http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo

docker-build:
	docker build -t $(PROJECT) .

# re-uses ssh agent
# presupposes your buildout cache is in /var/tmp as configured in .buildout
# also loads your standard .bashrc
docker-run:
	docker run -i -t \
		--net=host \
		-v $(SSH_AUTH_SOCK):/tmp/auth.sock \
		-v $(HOME)/.gitconfig:/.gitconfig \
		-v /var/tmp:/var/tmp \
		-v $(HOME)/.bashrc:/.bashrc \
		-v $(HOME)/.buildout:/.buildout \
		-e SSH_AUTH_SOCK=/tmp/auth.sock \
		-v $(PWD):/app -w /app -u app $(PROJECT)



devel: bin/buildout
	bin/buildout -c buildout.cfg

test:
	bin/test -s ploneintranet.pagerank

### helper targets ###

bin/buildout: bin/python2.7
# keep these in sync with config/versions.cfg
	@bin/pip install setuptools==6.0.2
	@bin/python bootstrap.py -v 2.2.1

bin/python2.7:
	@virtualenv --clear -p python2.7 .
