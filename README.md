# docker-unionfs

Example: 
```
  docker run -it --rm --name unionfs --privileged \
		-v /tmp/branch_one:/top -v /tmp/branch_two:/bottom -v /tmp/branches_merged:/merged \
		unionfs "-o auto_unmount,allow_other /top=RW:/bottom=RO /merged"
```
