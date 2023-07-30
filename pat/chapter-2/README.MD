
# Building a Ubuntu and Python Docker Image

Building of a Docker image based on the latest version of Ubuntu that includes
Miniconda, as well as a few important Python packages.

In addition, it does some Linux housekeeping by updating the Linux packages index,
upgrading packages if required and installing certain additional system tools.

To this end, two scripts are needed. One is a Bash script doing all the work on the
Linux level. The other is a so-called Dockerfile, which controls the building
procedure for the image itself.

## The Bash Script

The Bash script (script.sh), which doesn the installing, consists of three major
parts. The first part handles the Linux housekeeping. The second part installs
Miniconda, while the third part installs optional Python packages.

## The Dockerfile

The Dockerfile uses the Bash script to build a new Docker image.

# Building

If these two files are in a single folder and Docker is installed, then the building
of the new Docker image is straightforward. Here, the tag pyalgo:basic is used for
the image. This tag is needed to reference the image, for example, when running a
container based on it.

```bash
$ docker build -t pyalgo:basic .
Sending build context to Docker daemon 4.096kB
Step 1/7 : FROM ubuntu:LATEST
 ---> 4e2eef94cd6b
Step 2/7 : MAINTER alan
 ---> Running in 859db5550d82
Removing intermediate container 859db5550d82
 ---> 40adf11b689f
Step 3/7 : ADD install.sh /
 ---> 34cd9dc267e0
Step 4/7 : RUN chmod u+x /install.sh
 ---> Running in 08ce2f46541b
Removing intermediate container 08ce2f46541b
Step 5/7: RUN /install.sh
 ---> Running in 112e70510c5b
...
Removing intermediate container 112e70510c5b
 ---> 314dc8ec5b48
Step 6/7: ENV PATH /root/miniconda3/bin:$PATH
 ---> Running in 
Removing intermediate container
 ---> ...
Step 7/7 : CMD ["ipython"]
 ---> Running in ...
Removing intermediate container ...
 ---> ...
Successfully built ...
Successfully tagged pyalgo:basic
$
```

# List

Existing Docker images can be listed via `docker images`. The new image should be on
top of the list:

```bash
$ docker image
REPOSITORY  TAG     IMAGE ID        CREATED
pyalgo      basic   a0bb86daf9ad    2 minutes ago
```
