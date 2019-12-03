sudo docker build -t spothakanoori/vuejsproj .

sudo docker run -i -p 6000:60 --rm --name vuejsproj spothakanoori/vuejsproj:latest
