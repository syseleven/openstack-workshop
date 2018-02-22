## Creating a network environment in OpenStack

We will cover four topics now:

1. creating a network and a subnet using heat.
2. creating a router and connect subnet and public network.
3. creating security groups to allow traffic to access virtual machines inside your network topology.
4. Deploy virtual ports and connect security groups to them.

### Network and Subnet

Have a look at the HOT template "02_network_environment.yaml" 
You will notice different sections inside this YAML file:

```heat_template_version:```
This section declares, which version of the "language" HOT you are talking.

```description:```
This section is an optional description of what this template does


```resources:```
The next section is the most important one, because it actually creates something inside the OpenStack environment.
You can see here that we create a network object and a subnet object. A network in this context serves as a container to deploy several subnets in. Also a network is needed to assign floating ip obejcts. 
The subnet is needed for any private ips. It also controls the DHCP behaviour in your networking environment.


### Routing

To deploy a routed network you can use the example 02b_routed_network.yaml. 
You can see a new section in this template: ```parameters:```. In this example only one parameter is used to keep the public network id as a variable.

You can in this template that we build two additional resources: a router and th object, that connects the router to the private subnet we build earlier.

### Security Groups

The security group example (02c_network_and_security-groups.yaml) builds on top of the previous one. It adds a security group with two rules: One to allow SSH traffic, one that allows ICMP traffic.
You can also see that we introduced dependencies. Dependencies are necessary to control what resource gets build first. It also controls the reverse build procesdure (```openstack stack delete```). To delete resource in a controlled manner you need these dependencies.

### Creating network ports

The last example (02d_network_with_port_and_ip.yaml) shows an example that creates a network port and a floating ip object. The security group gets assigned to the network port. The floating ip also gets assigned to the network port. 
These are  the two last missing pieces to deploy a "ready to use" network topology where you can spawn virtual machines in and have a working but access controlled network layer.

