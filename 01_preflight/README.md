## Accessing the OpenStack API

To access the OpenStack API you need two credentials:

1. A valid pair of username/ password for authentication

2. A way to send valid commands to the API.


### Authentication 

We assume that you got username/ password from your OpenStack provider.
With these informations you are able to get all informations you need to authenticate against the OpenStack API.
Navigate to "Compute" --> "Access and Security" --> "API Credentials" and press "View Credentials". From that view 
copy the given "Project ID".


### Working environment

To be able to program against the OpenStack API we choose to fire up a pre defined HOT-template which starts a virtual machine with all neccessary client installed.

For that, navigate to "Compute" --> "Access and Security" --> "Key Pairs" and upload a valid SSH-public key using the button "Import Key Pair".
**Remember the name you gave to the key, we will use it later.**

Should you need to generate new ssh key you can do so in your local terminal.
```
# Generate an RSA key
# Just confirm with ENTER to save to default location
ssh-keygen -t rsa -b 4096
# Now add the generated private key to the authentication agent
ssh-add ~/.ssh/id_rsa

# show content of public key for upload
cat ~/.ssh/id_rsa.pub
```

Now navigate to "Orchestration" --> "Stacks" and klick on "Launch Stack".  
In the drop down field "Template" choose "URL" and paste the following URL: 
```
https://raw.githubusercontent.com/syseleven/heattemplates-examples/master/gettingStarted/sysElevenStackKickstart.yaml
```

Leave any other field untouched and press "Next".

Fill in the desired name for your stack (we will use the name "workstation" during this example). Also fill in the field "key_name" with the name you choose earlier for your public SSH key. Then klick "Launch" and you are done.

You can now navigate to "Compute" --> "Overview" and see, that a newly created VM has spawned. Klick on the name of the machine and copy the public ip address to be able to login there via SSH. To enable ssh agent forwarding add `-A`.

``` 
ssh -A syseleven@<pasteIPHere> 
```

You can now edit the OpenRC control file inside the home directory of the syseleven user. Change "demo_user", "demo_project_id" and "demo_password" to your corresponding values.  
Now source the OpenRC file:

``` 
source openrc 
```

And test if anything went well:

``` 
openstack server list 
```

This command should bring something up like 

```
syseleven@kickstart:~$ openstack server list
+--------------------------------------+------------------------+--------+-----------------------------------------+
| ID                                   | Name                   | Status | Networks                                |
+--------------------------------------+------------------------+--------+-----------------------------------------+
| 80df4610-c591-41c6-a1a1-75141e700b17 | kickstart              | ACTIVE | kickstart-net=10.0.0.10, 185.56.130.234 |
+--------------------------------------+------------------------+--------+-----------------------------------------+
```

If that command works, you are able to work through the rest of this tutorial, so clone it to the working directory:

``` 
git clone https://github.com/dschwabeS11/openstack_workshop.git
```

and move on to "02_network".






