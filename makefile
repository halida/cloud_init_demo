# https://cloudinit.readthedocs.io/en/latest/tutorial/qemu.html

clound_init_server:
	python3 -m http.server --directory cloud_init

download_image:
	cd images; wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img

# name=s1 make create_server
create_server:
	cp images/noble-server-cloudimg-amd64.img machines/$(name).img

# name=s1 make run_server
# quit: Ctrl-a x
run_server:
	qemu-system-x86_64                                            \
    -net nic                                                    \
    -net user,hostfwd=tcp::2222-:22 \
    -machine accel=kvm:tcg                                      \
    -m 1024                                                      \
    -nographic                                                  \
    -hda machines/$(name).img \
    -smbios type=1,serial=ds='nocloud;s=http://10.0.2.2:8000/'

connect_server:
	ssh -p 2222 ubuntu@localhost

rerun_cloud_init:
	cloud-init clean --logs --reboot
