# ceph-backup

**Very, very, very rustic** script to export and import [Ceph](http://ceph.com/) **RADOS** images ([Block Storage](http://docs.ceph.com/docs/master/rbd/rbd/))

Tested on my lab, posted at my personal blog:
http://nubla.do/

### Author

William Vera   
<billy@billy.mx>

### TODO
* Add a date prefix for the path of backup: `date +%F-%H%M%S`
* Add a option to choose what backup do you want import
* Validate if the dest pool exist and then create
* At backup, get the pool info: `replicated size` and `pgp_num` and set it at the restore: `ceph osd dump | grep ^pool`
* Add more stuff at the **TODO**
