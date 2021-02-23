
remote=${1:-lancs}
rclone mount $remote: ~/mnt/$remote/ --vfs-cache-mode writes -vv
