GitBook is an excellent piece of open source software made to publish books as websites, or more often software documentation websites with the lightness and easiness of node.js  
It combines javascript for the engine, markdown for the content and git for version control.

There is not just a server. GitBook's guys also made a great editor as a perfect server's companion.

GitBook company offers its server creature for download or SAAS.  
The editor is available for download and can run on Windows, Mac, and Linux as well.

If you want to host your own documentation, an excellent solution is to have the server available in a Dockerized flavor.

I've tried to make it easy to launch or place it in a docker compose structure, a docker swarm stack or a kubernetes orchestra. But because it also has its editor, why not dockerize it too to have it always ready at your command?  
So I've dockerized both of them.

To learn more about what GitBook is, please visit the official website: [https://www.gitbook.com/](https://www.gitbook.com/)

# Supported tags and respective `Dockerfile` links:

* [server, server-1, server-1.0, server-1.0.0, latest](https://github.com/pulciux/gitbook-dockerized/blob/master/Dockerfile_server)
* [editor, editor-1, editor-1.0, editor-1.0.0](https://github.com/pulciux/gitbook-dockerized/blob/master/Dockerfile_editor)

# Server usage:

* It runs your book server as an unprivileged user with uid 1000.
* It exposes the GitBook standard ports 4000 and 35729 \(for refresh\)
* it mounts a volume at /var/lib/gitbook where it expects to find the root book directory to serve
* when it starts for the first time, if there is no book at `/var/lib/gitbook`, it initializes a new one and then serves it.

`docker run --rm -d blys/gitbook:server`

If your book is located somewhere in your filesystem, e.g.: `~/myBooksLybrary/Import/MyBook`

`docker run --rm -d -v~/myBooksLybrary/Import/MyBook: blys/gitbook:server`

if you want to see your book on your host, port 80

`docker run --rm -d -p 80:4000 blys/gitbook:server`

then open your browser and go to `http://localhost/`

# Editor usage:

* It runs as an unprivileged user with uid 1000

* it needs X11 access to draw its windows

* it's based on debian jessie for libraries dependencies reasons

If your library books are located somewhere in your filesystem, e.g.: `~/myBooksLybrary` launch it this way:

`docker run --name GitBook -it -e DISPLAY=$DISPLAY -v ~/myBooksLybrary:/var/lib/gitbook/GitBook/Library -v /tmp/.X11-unix:/tmp/.X11-unix:rw blys/gitbook:editor`

