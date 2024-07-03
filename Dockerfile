FROM primeimages/odin:latest

WORKDIR /app

COPY /app/main.odin .

CMD [ "odin", "build", "." ]

# CMD [ "pwd" ]
# CMD [ "ls -la" ]
