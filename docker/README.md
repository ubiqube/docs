[overall architecture][arch.diagram]


Install MSA-v2 on your docker engine
------------------------------------

1. check your dockerhub account password - or create a new account
2. ask for access to private repo: `ubiqube/msa2`
3. check your docker engine has access to dockerhub
4. create a new directory: `ddmsa/`
5. cd `ddmsa/`
6. download: [docker-compose.yml][docker-compose]
7. run: `sudo docker login`
8. run: `sudo docker-compose up -d`
9. verify that the MSA contrainers are up: `sudo docker-compose ps`
9. browse: https://localhost/


Requirements on the host machine
--------------------------------

The host machine should have hardware specs similar to that
of the VM running the .ova flavour of MSA:

- 16Go, 4CPU, 100Go


Docker for Linux (or Linux VM)
------------------------------

	sudo sysctl -w vm.max_map_count=262144
	sudo tee -a /etc/sysctl.conf <<< "vm.max_map_count=262144"


Docker for Mac
--------------

From the command line, run:

	screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
	
Press enter and use`sysctl` to configure vm.max_map_count:

	sysctl -w vm.max_map_count=262144
	
To exit the screen session, type Ctrl a d.

Docker for Windows
------------------

	docker-machine create -d virtualbox  \
		--virtualbox-cpu-count=2 \
		--virtualbox-memory=8192 \
		--virtualbox-disk-size=50000 \
		default


In the docker VM, do as for Linux host above:

	sudo sysctl -w vm.max_map_count=262144
	sudo tee -a /etc/sysctl.conf <<< "vm.max_map_count=262144"


The docker VM is mapped to a local IP on the Windows host,
access to the msa is _NOT_ done via `https://localhost`,
you must lookup the IP with:

```
$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER     ERRORS
default   *        virtualbox   Running   tcp://192.168.99.100:2376           v19.03.5
```



[arch.diagram]: https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=msa-v2%20-%20ddmsa%20overview#R7Vtbd5s4EP41fnQOIK6PjZN0e1un616SfemRQQYSjFghx3Z%2FfcEIc5FMcQPGPmeTh8AwgPTNN6OZERmByXLzlsDI%2B4QdFIwUydmMwM1IUWSgGcmfVLLNJKbEBC7xHaZUCGb%2BT8SEEpOufAfFFUWKcUD9qCq0cRgim1ZkkBC8rqotcFB9awRdxAlmNgx46XffoR6bhWIU8r%2BQ73r5m2Xdyq4sYa7MZhJ70MHrkgjcjsCEYEyzo%2BVmgoIUvByX7L67A1f3AyMopG1uiJeO9NEH4Vt3%2BuHTg%2BL%2FWLvemD3lBQYrNmE2WLrNESB4FToofYg8Atdrz6doFkE7vbpObJ7IPLoM2GUHxt5eNz25h5QiEu4kipRKF34QTHCAye7xYLH7SeQxJfgZla6oN%2BlvegcOaUme%2FSRynAzDpymxVCl9QA5wemLjpW%2BzYzeAccyO2XwRoWhzEEh5b56E1wgvESXbRIXdAICZ3cIoravZ6brgh5wb3StxQ9cZLRkl3f2TC6slB8xwYiOCzSQM5l%2FW%2F83eLqdq%2BG0JydNYFxhRD2hqAf8lOXTpbuKZaE7qkuSdAr2S6M39u0O6r%2BEKRwSk27aICI5hzaXCeJylBPY8aDxFAhXj7d2zbD1ZYL19RHqN%2Bf6dvizwB2P6bfZ9pVvQ89dffgrNd%2FG4Ar0lrkYHsAq9gg9tdyQJJJ1i60BkLoTY6raJ5otusAVSBVpDgKwo3qhdMFYILeCg%2FfruAnGtc1YErIiystRXKFA5YCdwmcAILxBdoFbRVbWW8Kp90dbg0L2dXWCorQOrDB5qTQ7Ym0vMDerAnsEaxi9is0%2Bv5CzBFFIfhywhhsRmVVdS03QTVmWrCqMBOBgNk0cRdIDi9cPUfLz%2F%2FOGfzcLV3t9ZwUu4Hu8rsAIx5CRVHjvFhHrYxSEMbgvpdYFpilKh8xHjiCH5hCjdMvDgiuIqzgmAZPuQ3n%2Bl5aeP7HG7k5tN5Ww7KlcoAgvEeEVs1DBPLdOjkLiINuixhDPFoNGeBAUJU16qlbDIOrtb3xACtyWFCPshjUtPvk8FJZqY9TCmlC19rH5ykI2g4Ml%2BKn9OHY3zvwC50E7n%2BdqUp38%2FBMqVVoUM8KWqLvBExezJE%2FPIcGJP3Pg0c0TTYqePpUuFH6YnuRuW3Nc4yn%2FTp9wj4ieIIfJqn9Z5n25cKTp2as4LgVLL6upROxspu6ugy9HRwaqtxVqtu1XXN8wm%2FX6iw96KAy0sFVoWq0wDMR9KvH8skfugG%2FTPXLNr4raNUJ%2B1p%2Bn4Np7FkfMAvz25c0d%2BFpS2l2%2FiviwsyDeEmConCk2mVF%2FvLK1VcPqDeCCcKJ8tDEGe%2Fl3WGMplm0ZdQn3tB84i2F5efmbyBacoP%2ButUuILeZjg46HOkBxb%2FWApW9UeqaLxNacu6ur3VnPyUKp5e6EcDoLAj2L0ewxhHGXbmwt%2Fk%2BLeTf%2BzhhnPPlFfuQvMosl7srh5HD989%2FS%2FAX2v%2FCDTNpuRp1x75ePW3j8Pu4rFx91GUvW9ksp1Zlj9JPm6%2BDWHcvy6un6KFN%2FiSGkK2knn5MaCRaQvNxZCBvhdjOQ5X6%2F5fknswSg9JAkmMHSDFgDOof3s7nx8uqKBH6LfJT3tcVSrOMqi7q90ynh4brXIldJ9I1M4caVlPDxROOQ8TGpXVhwbDmVD%2FJ5D8ZDTZz2QrgJik22qzk1QlDArOYBRdGFenpeIp%2FBycbgUVY13F4airLRDUe7gGygxiqJgebea%2B2MY%2BWOCYv7Dj7NGFIATrj7izEcfdrWpZt%2FGebW%2Bcrqdfq%2FtdTZVB84gjt9KOaFN1UHTjqOzBbMWg43m6qmur6jdZgtiwglaHv%2B3z6sL%2F2%2FbrWCoGCJscvONrSFM3Ap24fgFTW6h3mBN7qZRl1DXZEEwP6M%2BhKqerg%2FRZMCzhozbAth%2FtDtU90blu7AiDx8UtVrdOzxmfPEBgygtD5Q7TD1EOPwu7%2FPdth9H52TpHmS%2BrbiM4ViRrqT0dUEw9sN8C%2BGiPzuVJUEx3RfUwsgpauBe0hKv8Ev8ee1jN426hPqzP4dht9%2F%2BD0RpwZ6EkNLa8SE6bT%2Fu%2F4kyq1uKf0UFt78A

[docker-compose]: ./docker-compose.yml
