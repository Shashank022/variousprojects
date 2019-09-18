sudo docker build -t spothakanoori/vuejsproj .

sudo docker run -i -p 8000:80 --rm --name vuejsproj spothakanoori/vuejsproj:latest
