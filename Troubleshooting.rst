Troubleshooting
===============

This is a page for every common errors that are encountered while installing apps.
1. Troubleshooting VM partition
2. How to install and use ngrok
3. GSQL Structure

problem : 
1. Unable to expand cluster in vm

    If the output returns this error : 
    .. code-block:: console

        [Error] ExternalError (Failed to send rpc GetClusterInfo to <Cluster IP>:9177 after retry 3 times; rpc error: code = Unavailable desc = 
        all SubConns are in TransientFailure, latest connection error: connection error: desc = "transport: Error while dialing dial tcp 
        <Cluster IP>:9177: connect: no route to host"
    
    then you need to check open ports using this command : 
    .. code-block:: console
    
        #install iptables if not installed
        $ sudo yum/apt install iptables-services
        #start the service
        systemctl start iptables
        #check if the service is running
        service iptables status
        #check if port "9177" is open in firewall in Chain Input (policy Accept)
        $ sudo iptables -L
        #if the port isn't open yet, then add it into the chain input policy using :
        sudo iptables -I INPUT -p tcp -m tcp --dport 9177 -j ACCEPT
