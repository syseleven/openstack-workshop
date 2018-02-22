## Single server

### unprovisioned vm

In the first example (03a_simple_server.yaml) you see how a simple virtual machine gets assigned to
your network infrastructure. You should already be able to access the virtual 
machine via SSH after starting the stack:

```
openstack server ssh -l ubuntu exampleserver
```

### provisioned vm

One possible way to provision newly created vms is [cloudinit](http://cloudinit.readthedocs.io/en/latest/). With cloudinit you can manage users, SSH-Keys and upload any kind of kickstart scripts to your newly created vm. It also has (limited) capabilities of package management for different linux distributions.

In this example you see, how we provision a single host with a useful user configuration (username, list of SSH-keys and an install script which does some example installation routines).

Notice that we also changed some lines in the server block: SSH-Keys are now injected via cloud-init. Its type also changed from "string" to "comma_delimited_list". That means, that we are now able to inject a list of SSH-keys into our created user. 
It also changes the way we start the stack: instead of listing single parameters using the ```--parameters``` flag we pass the environment 03b_provision_single_server-env.yaml file as argument to the openstack command.
The second necessary change in the server description is the assignment of the cloud-init resource ( ```user_data: { get_resource: cloud-init-config }``` ).

You can now login into the machine using your defined user:


```
openstack server ssh -l workshop exampleserver
```
