Building:
```
docker build --network host -t eio .
```

Example interaction including all required flags:
```
/usr/bin/docker run --network host -v /sys/fs/cgroup:/sys/fs/cgroup:rw  --privileged -t -i eio /bin/bash
```
