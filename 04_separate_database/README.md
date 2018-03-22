## scaled setup

In this tutorial we will show how you can scale out your setups. As an example we assume, that we want to run our database service on a dedicated host.

### Server Groups

In this example we organise our servers in some other way than before: We use resource groups to organise our servers. This is not necessary at this point, but will pay off later. One advantage already at this point is, that we can structure our code in different .YAML files (one for each kind of server).

### Preparing scaleout: consul

If we leave the world of single server setups it is nice, to have any kind of service discovery running. With that you won't need any hard coded ip adresses, instead you can just look up service names.
In this example we use consul for that purpose.

### Demilitarized zone

First we need the internal IP of the "db0" node
```
$ openstack server list
+--------------------------------------+-----------+--------+------------------------------------------+---------------------------------------------+-----------+
| ID                                   | Name      | Status | Networks                                 | Image                                       | Flavor    |
+--------------------------------------+-----------+--------+------------------------------------------+---------------------------------------------+-----------+
| c69945e1-52d3-4e32-8e9b-eac678fa7571 | web0      | ACTIVE | example network=10.0.0.11, 185.56.131.48 | Ubuntu 16.04 LTS sys11 optimized 2018.03.21 | m1.small  |
| db3de9f0-1098-457f-b141-1351a1da33c8 | db0       | ACTIVE | example network=10.0.0.10                | Ubuntu 16.04 LTS sys11 optimized 2018.03.21 | m1.medium |
+--------------------------------------+-----------+--------+------------------------------------------+---------------------------------------------+-----------+

```

For the first time we create a virtual machine that is not reachable from the outside. For that reason we need to enable AgentForwarding to be able to jump from one host ("web0") to the other ("db0").

```
$ openstack server ssh web0 -l workshop --option "ForwardAgent=yes"
```

From there you can jump to the ("db0") node.
```
# $ ssh < IP address of db0 >
# e.g.
#
$ ssh 10.0.0.10
```





