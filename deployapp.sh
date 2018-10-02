#!/bin/bash
# sed to replace old app name with new application
###NOTE THIS IS THE  MAC SED VERSION..MIGHT NEED EDITS FOR LINUX
#put usage
# step 1 create dir with appname
# step 2 cd to that dir
# step 3 git clone appname.git
# mvn fabric8:deploy -Popenshift
# sleep for 1 minute
# curl test the app
echo $1
if [ -z "$1" ] ; then
        echo "appname should be provided"
fi

appname=$1
echo "name of app to be deployed"
mkdir $appname
cd $appname
git clone https://github.com/redhathameed/$appname.git
oc login -u ahameed -p Sep2018 https://master.rhdp.ocp.cloud.lab.eng.bos.redhat.com:8443


oc new-project $appname
oc get projects
sleep 10s
cd $appname
pwd
mvn fabric8:deploy -Popenshift
sleep 100s
curl http://vertx$appname-$appname.app.rhdp.ocp.cloud.lab.eng.bos.redhat.com /$appname
