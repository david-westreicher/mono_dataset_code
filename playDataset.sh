docker build -t mono_dataset .
xhost local:root
docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm -it -v /home/david/Documents/code/matchmover/dataset/:/images mono_dataset /app/bin/playDataset $1 $2
