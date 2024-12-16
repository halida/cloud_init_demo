# Demo project for use cloud init to create qemu server

https://cloudinit.readthedocs.io/en/latest/tutorial/qemu.html

## Usage

- host cloud init server `make clound_init_server`, change user-data for your ssh pub key
- `make download_image`
- `name=s1 make create_server`
- `name=s1 make run_server` quit: Ctrl-a x
- `make connect_server`
