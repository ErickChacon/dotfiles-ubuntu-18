path_local=$(pwd)
cloud_path=$HOME/Cloud/
cloud_path_regex=$(echo $cloud_path | sed -e 's/\//\\\//g')

if [[ $path_local =~ $cloud_path_regex ]]; then
    rel_path=$(echo $path_local | sed -e 's/'$cloud_path_regex'//')

    if [[ $rel_path =~ '/' ]]; then
        remote=$(echo $rel_path | sed -e 's/\/.*$//')
        folder_remote=$(echo $rel_path | sed -e 's/^.*'$remote'//')
        folder_remote=$(echo $folder_remote | sed -e 's/\///')
        echo Executing: rclone sync $path_local $remote:$folder_remote
        rclone sync $path_local $remote:$folder_remote --progress
    else
        echo "Root of cloud: not syncing"
    fi

else
    echo "Outside Cloud: not syncing"
fi

