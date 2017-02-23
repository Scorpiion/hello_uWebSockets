# uWebSockets example using C++ on Sourcevoid 

## Create archive (or your own Github repo)

    git clone git@github.com:Scorpiion/hello_uWebSockets.git
    cd hello_uWebSockets
    ./zip.bash
    cd -
    
## Create env 

Follow normal procedure @ https://cloud.sourcevoid.com. 

## How does it work? 

This repo includes an install script that downloads, compiles and install uWebSockets into the env cache. Then it uses a startup script to start uWebSockets echo example and forward the SIGTERM signal correctly. It only downloads and compiles uWebSockets on the first deploy, the build pipeline stage can be outcommented after a first deployment. 


