#!/bin/bash

# Version (optinally overridden from env vars)
if [ -z ${UWS_VERSION+x} ]; then 
  UWS_VERSION="0.13.0"
fi

# Install uWebSockets if not already installed
if [ ! -d "${HOME}/usr/include/uWS" ] ; then
  # Go to env cache (/home/cuser/cache/)
  cd $HOME
  
  # Download uWebSockets
  curl -L -O https://github.com/uWebSockets/uWebSockets/archive/v${UWS_VERSION}.tar.gz

  # Unpack
  tar -zxvf v${UWS_VERSION}.tar.gz
  rm -rf uWebSockets
  mv uWebSockets-${UWS_VERSION} uWebSockets

  # Remove tar.gz
  rm v${UWS_VERSION}.tar.gz
  
  # Change default port examples to 8080
  sed -i 's/3000/8080/g' uWebSockets/examples/echo.cpp
  sed -i 's/3000/8080/g' uWebSockets/examples/multithreaded_echo.cpp
  
  # Build uWebSockets
  cd uWebSockets
  cmake .
  make
  
  # Install into persistent app cache (everything in ${HOME} is saved between deploys)
  mkdir -p ${HOME}/usr/lib64
  cp libuWS.so ${HOME}/usr/lib64/
  mkdir -p ${HOME}/usr/include/uWS
  cp src/*.h ${HOME}/usr/include/uWS/ 
  
  # Build complete
  echo "Build complete"
  echo ""
fi

