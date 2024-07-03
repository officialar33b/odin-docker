# Implementation

## Requirements:
* docker (version >=25.0.3) 

## Directory Setup:
```
.
├── app
│   └── main.odin
├── Dockerfile
```

## Dockerfile Example:
```
FROM primeimages/odin:latest

WORKDIR /app

COPY /app/main.odin .

CMD [ "odin", "build", "." ]

```

## Docker Commands:
From outside the /app directory run this command to build the image with an image tag:

` docker build -t odin-image.`

To create and run a container based on this image with a custom name, a custom bind mount, and to remove the 
container after running it:

` docker run --rm -w /app -v $(pwd)/app:/app --name odin-container odin-image`

For an interactive shell:

` docker run -it --rm -w /app -v $(pwd)/app:/app --name odin-container odin-image`

## References:
[PlummersSoftwareLLC/Odin-docker](https://github.com/PlummersSoftwareLLC/Odin-docker)