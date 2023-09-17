We dont define any routes here because AWS routing is already known to the host this plugin is running on.
Routes for other kubernetes nodes will be added by kubernetes automatically at the appropriate time.
The only reason we would add routes to a static host-local IPAM is if there is no other network management mechanism for your nodes. 
