sudo docker build -t spothakanoori/vuejsproj .

sudo docker run -i -p 8080:80 --rm --name vuejsproj spothakanoori/vuejsproj:latest
