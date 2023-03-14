build: ./Dockerfile ./entrypoint.sh
	docker build -t unionfs ./
	touch $@

.PHONY: test
test: build
	mkdir -p /tmp/{branch_one,branch_two,branches_merged}
	docker run -it --rm --name unionfs --privileged \
		-v /tmp/branch_one:/top -v /tmp/branch_two:/bottom -v /tmp/branches_merged:/merged \
		unionfs "-o auto_unmount,allow_other,uid=1000,gid=1000 /top=RW:/bottom=RO /merged"
