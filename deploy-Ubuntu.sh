#!/bin/bash
# This file contains stuff we can do every time we refine docent-learner code. (This is in contrast to the stuff we want to do only once, which is in the bootstrap file.)

#TODO: make apache restart optional

basedir="/var/www/html/docent-learner"
imagesdir="images"
textselectdir="textselect"
pydir="/var/www/docent-learner/"

sudo mkdir $basedir

# Make directories, copy files, and check permissions
sudo cp sites-enabled/docent-learner-apache.conf /etc/apache2/sites-enabled/

sudo mkdir "$basedir/$imagesdir"
sudo cp images/* "$basedir/$imagesdir"
sudo chmod a+rw "$basedir/$imagesdir"

sudo mkdir "$basedir/$textselectdir"
sudo cp textselect/* "$basedir/$textselectdir"
sudo chmod a+rw "$basedir/$textselectdir"

# Copy python source
sudo mkdir "$pydir"
sudo cp -r src/* "$pydir"

# Copy var files (stuff that changes during runtime)
sudo mkdir "$basedir/var/"
sudo cp -r var/* "$basedir/var/"
sudo chmod a+rw "$basedir/var/config/"

# Copy static files (stuff that should never change)
sudo mkdir "$basedir/static/"
sudo cp -r static/* "$basedir/static/"

# Copy html
sudo cp -r html/* "$basedir"

# Restart apache after deploying .conf file
sudo service apache2 restart
