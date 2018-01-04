#!/bin/bash

echo ""
echo "--- LAUNCH ---"

#Java executable for standard Linux environment
export JAVA=java
#Java executable for MinGW environment
#export JAVA=/c/jdk9/bin/java.exe

echo " > run monitor"
echo ""

# the classpath is needed for Spark's dependencies
$JAVA \
	--class-path 'build/class-path/*' \
	--module-path build/module-path \
	--add-modules java.xml.bind \
	monitor.Main
