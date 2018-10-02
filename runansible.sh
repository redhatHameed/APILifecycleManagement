#!/bin/bash
# sed to replace old app name with new application
###NOTE THIS IS THE  MAC SED VERSION..MIGHT NEED EDITS FOR LINUX
#put usage
echo $1
echo "old application name "
echo $2
echo "new app name"
sed -i .bak 's/'$1'/'$2'/g' newservicedetails.yml
sed -i .bak 's/'$1'/'$2'/g' updateservicedetails.yml
ansible-playbook   --inventory-file=ansiblehosts  updateservice.yml --connection=local
