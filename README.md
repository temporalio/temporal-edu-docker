This is the [Custom Workspace Image](https://www.gitpod.io/docs/configure/workspaces/workspace-image) for Temporal's [self-paced online courses](https://learn.temporal.io/courses/).

It installs each of the languages — Java, Go, Python, and Nodejs — currently used in our courses, as well as the `temporal` and `tctl` command-line clients.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/temporalio/temporal-edu-docker)

# Building and Publishing the Image
You'll find the published images [here in DockerHub](https://hub.docker.com/r/temporalio/gitpod-edu/tags).

## Build the Image
NOTE: These were tested on an M2 Mac.

Be sure to replace `VERSION` on the last line with the version 
number ("tag") you want to assign to the image you're building. 
This should typically involve looking at the most recent image 
in DockerHub (use the link above) and incrementing the number 
on the right side of the period by 1. For example, if the most 
recent image is `temporalio/gitpod-edu:1.1`, then the one that
you're building to supersede it should probably be 
`temporalio/gitpod-edu:1.2`.

```bash
docker build \
	--pull \
	--no-cache \
	-f Dockerfile \
	--platform linux/amd64 \
	-t temporalio/gitpod-edu:VERSION .
```

## Publish the Image
Once the build is complete, log into 1Password and find the shared
credentials for DockerHub (with the username `temporaltech`). 

Run the following command to log into DockerHub from the command line:

```bash
docker login --username temporaltech
```

When prompted for a password, click the **gitpod-edu read-write pat** 
field in 1Password, copy that value, and paste it into the terminal 
(do not use the value of the **password** field in 1Password or it will 
fail). You may then be prompted by the OS to enter your Login Keychain 
password (that value is something you've chosen, not anything in the 
1Password entry for DockerHub). Proceed to the next step after you see 
a "Login Succeeded" message.

Run this command to publish the image (replace `VERSION` here with the
same value you replaced it with in the build command above).

```bash
docker push temporalio/gitpod-edu:VERSION
```


