#!/bin/bash
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2021                                            //
#//  Created: 01, June, 2021                                 //
#//  Modified: 01, June, 2021                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

TAG_VERSION=latest
DOCKER_IMAGE=bensuperpc/ndless

case "$1" in
    -version|-v)
        TAG_VERSION=$2
        shift
        shift
        ;;&
    -h)
        echo "Usage: ${0##*/} [-version latest nspire-gcc -v]"
        echo "More info: https://hackspire.org/index.php/C_and_assembly_development_introduction"
        exit 1
        ;;
esac

if [ $# -eq 0 ]
then
    echo "No arguments supplied"
    exit 1
fi

docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ${DOCKER_IMAGE}:${TAG_VERSION} $@
