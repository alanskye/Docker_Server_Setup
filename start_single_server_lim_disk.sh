
#!/bin/sh
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [name] [port]"
	exit 1
fi

docker run \
  -itd \
  --restart unless-stopped \
  --storage-opt size=512g \
  --cpus="32" \
  --ipc host \
  --gpus '"device=0,1"' \
  --memory=128g \
  -v /mnt:/mnt \
  --name $1 \
  -p $2:22 \
  tfgpu:1.0

# -v [host_path]:[mounting_point_in_the_container]
# --gpus all / '"device=1"'
