#!/bin/bash
# wvera@suse.com

BackupPath=/home/cephadm/backups

usage() {
    echo "Ceph Export / Import Block Storage"
    echo "$0 <export|import>"
}

export() {
for pool in $(rados lspools)
do
  for  images in $(rbd ls -p $pool)
  do
  PoolExportPath=${BackupPath}/${pool}
  mkdir -p $PoolExportPath
  rbd export -p $pool $images ${PoolExportPath}/${images}
  done
done
}

import() {
if [ ! -d $BackupPath ]
    then
    echo "You don't have backups in $BackupPath or variable is empty"
    exit 1
    else 
    for pool in $(ls $BackupPath);do
    ceph osd pool create $pool 128
    for image in $(ls ${BackupPath}/${pool});do 
    echo ${BackupPath}/${pool}/$image 
    rbd import --dest-pool $pool ${BackupPath}/${pool}/$image $image
    done
    done
fi

}

ask() {
	case "$DOIT" in
  	"export")
    export
  	;;
  	"import")
    import
  	;;
  	*)
    usage
  	;;
	esac
	
}
if [ "$#" -ne "1" ]; then usage; else DOIT=$1; ask;fi

