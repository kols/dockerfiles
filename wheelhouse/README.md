# Usage

-   Build wheels

    1.  Create a container which holds the volume

        `$ docker run --entrypoint="true" --name=wheelhouse kane/wheelhouse`

    2.  Build wheels

        `$ cat requirements.txt | docker run -i --volumes-from wheelhouse kane/wheelhouse`

        or in background

        `$ cat requirements.txt | docker run -i -a stdin --volumes-from wheelhouse kane/wheelhouse`

-   Use built wheels

    `$ docker run --volumes-from=wheelhouse <image> pip install -r /wheelhouse/requirements.txt --no-index -f /wheelhouse`
