#!/bin/bash

set -e

echo -e "                                       "
echo -e "                  .,.                  "
echo -e "                 ,,,,,                 "
echo -e "                 ,,,,.                 "
echo -e "                 .,,,                  "
echo -e "     ,,,          ,,,          ,,,     "
echo -e "    ,,,,,,,       ,,,       ,,,,,,,    "
echo -e "      .,,,,,,,           ,,,,,,,.      "
echo -e "           ,,,,         ,,,,           "
echo -e "                                       "
echo -e "                                       "
echo -e "          .,,,,         ,,,,.          "
echo -e "      ,,,,,,,,           ,,,,,,,.      "
echo -e "    ,,,,,,,       ,,,       ,,,,,,,    "
echo -e "     ,,,          ,,,          ,,,     "
echo -e "                 .,,,                  "
echo -e "                 ,,,,.                 "
echo -e "                 ,,,,,                 "
echo -e "                  ..                   "
echo -e "========================================"
echo -e "          Checking variables            "
echo -e "========================================"

CHECK="\u2714";
RED_X="\u274c";
FILE=sonar-project.properties

if [ -z $SONAR_HOST ]; then
    printf $RED_X;
    printf " Sonar Host is required.. \n";
    exit 1;
else
    printf $CHECK;
    printf " Sonar Host \n";
fi

if [ -z $SONAR_TOKEN ]; then
    printf $RED_X;
    printf " Sonar Token is required.. \n";
    exit 1;
else
    printf $CHECK;
    printf " Sonar Token \n";
fi

if [ -z $PLUGIN_PROJECT_KEY ]; then
    printf $RED_X;
    printf " Sonar Project Key is required.. \n";
    exit 1;
else
    printf $CHECK;
    printf " Sonar Project Key \n";
fi

if [ -z $PLUGIN_SOURCES_DIRECTORY ]; then
    printf $RED_X;
    printf " Sources Directory is required.. \n";
    exit 1;
else
    printf $CHECK;
    printf " Sources Directory \n";
fi

if [ -f "$FILE" ]; then
    printf $CHECK;
    printf " sonar-project.properties file on project \n";
else
    printf $RED_X;
    printf " sonar-project.properties is required.. \n";
    exit 1;
fi

echo -e "========================================"
echo -e "          Executing scanner             "
echo -e "========================================"
/sonarqube/bin/sonar-scanner -Dsonar.host.url=$SONAR_HOST -Dsonar.login=$SONAR_TOKEN -Dsonar.projectKey=$PLUGIN_PROJECT_KEY -Dsonar.sources=$PLUGIN_SOURCES_DIRECTORY -Dsonar.projectVersion=$DRONE_BUILD_NUMBER -Dsonar.log.level=DEBUG -Dsonar.showProfiling=true -Dsonar.scm.provider=git -Dproject.settings=sonar-project.properties
echo -e "========================================"
echo -e "Maintainer: miguel.herrera0@walmart.com "
echo -e "========================================"