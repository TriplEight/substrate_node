# substrate_node
###### Compact set of terraform and ansible roles for deploying substrate based node(tested with polkadot, compound, acala and rococo). 
###### Compatible with cumulus based parachain nodes. 

## Scope

### Terraform
###### - Deploy instances with an external ip address and extended disk(optional)
###### - Generate ansible inventory file

### Ansible
#### substrate_node role
###### - Prepare env, install and run substrate based nodes.
###### - Upgrade nodes.
###### - Revert to previous binary.
###### - Rotate session keys.
###### - Safe start/restart.
###### - Add reserved peers through RPC.

#### border playbook(incl substrate based role, nginx role and mtail role)
###### - Prepare env, install nginx and setup streams on borders.
###### - Define public IP(of border) and port(listened by nginx) on nodes.
###### - Setup mtail(prometheus exporter which exposes some nginx metrics based on logs such as requests count, error count by streams)

#### substrate_wss playbook(incl nginx role)
###### - Setup WSS(with self-signed certificate) on nodes. 
