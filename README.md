# Sample NodeJS static server

This is sample application to show how one can create a docker image running an
unprivileged user.

## Installing

The installation process is separated in two phases, the first one involves
bulding the docker image and the second install the node dependencies.

### The docker image

The docker image inherits from [dockerfile/nodejs][node-image], and create the
user `app` that will be used to run the container. By default the container run
the command `npm start`. Besides that, the image exposes the private port 3000
and expects that a node application be available in the `/app` path.

#### Build

To build the image run:

```shell
$ docker build -rm -t joaodubas/staticserver:0.0.1 .
```

#### Run

With the image built, execute:

```shell
$ docker run -rm -i -t -v `pwd`:/app joaodubas/staticserver:0.0.1
```
To run another npm command, override the command statement. For example, to
install dependencies:

```shell
$ docker run -rm -i -t -v `pwd`:/app joaodubas/staticserver:0.0.1 install
```

To run another command on the container, override both entrypoint and command
statements. For an example, to run node repl:

```shell
$ docker run -rm -i -t -v `pwd`:/app -entrypoint node joaodubas/staticserver:0.0.1 --harmony
```

### The node app

To install the node dependencies run:

```
$ docker run -rm -i -t -v `pwd`:/app joaodubas/staticserver:0.0.1 install
```

To run the server:

```shell
$ docker run -rm -i -t -v `pwd`:/app joaodubas/staticserver:0.0.1
```

## License


Copyright (c) 2014 Joao Paulo Dubas <joao.dubas@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[node-image]: https://index.docker.io/u/dockerfile/nodejs/
