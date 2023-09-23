The purpose of these files is to define a set of per-host networks that will form the basis of an overlay on top of your existing host network.
The chosen addresses dont matter by themselves - they must simply not conflict with the host network or each other.

We dont define any routes here because AWS routing is already known to the host this plugin is running on.
Routes for other kubernetes nodes will be added by kubernetes automatically at the appropriate time.
The only reason we would add routes to a static host-local IPAM is if there is no other network management mechanism for your nodes. 
