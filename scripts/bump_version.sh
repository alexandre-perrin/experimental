#!/usr/bin/bash

INDICE=${1:-PATCH}

sed 's/ *= */=/' version.mk > ~version.mk
source ~version.mk
rm ~version.mk

# Increment indice
VALUE=${!INDICE}
((VALUE++))
eval ${INDICE}=$VALUE

# Reset sub indices
case $INDICE in
    MAJOR)
        MINOR=0
        PATCH=0
        ;;
    MINOR)
        PATCH=0
        ;;
    PATCH)
        ;;
    *)
        echo "Invalid indice"
        exit 1
        ;;
esac

VERSION=${MAJOR}.${MINOR}.${PATCH}
