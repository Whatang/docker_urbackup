A docker image for a UrBackup server, built for ARM and AMD64.

This image is essentially the same as cstras/urbackup, except the build can be parametrized by architecture and version.

# Building

To build, use the `build.sh` script:

    ./build.sh
	
will run the build with the default settings (building UrBackup server v2.2.11 for AMD64).

To build for ARM:

	./build.sh armhf
	
To build a different version of UrBackup - 2.2.10, say:

	./build.sh amd64 2.2.10

After building for both ARM and AMD64, and pushing to dockerhub. use the `set-manifest.sh` script to create the multi-architecture image.

# Running

Get this server running before you start running any clients.

Before running you will need to create 2 docker volumes:

	docker volume create var_urbackup
	docker volume create urbackup_usrshare

Here's a sample `docker-compose.yml` file - it's unlikely you'll need to do anything different to this. Just replace `/path/to/your/backup/dir` with the real path to where you want to keep the backups.

	version: '2'

	services:
		urbackup:
			image: whatang/docker_urbackup:latest
			restart: always
			ports:
				- 55413:55413
				- 55414:55414
				- 55415:55415
				- 35623:35623/udp
			volumes:
				- var_urbackup:/var/urbackup
				- /path/to/your/backup/dir:/media/BACKUP/urbackup
				- urbackup_usrshare:/usr/share/urbackup
			network_mode: "host"

Once you've started the server running the first thing you must do is connect to the web interface at http://localhost:55414 and create an admin user in Settings > Users.

Your UrBackup server should now be broadcasting on the local network looking for clients. Download and install clients for the machines you want to back up, and if all is in order then the clients will automatically connect to the server and start backing up.
