#!/bin/bash

#if the root bookdir is empty initialize a new book
if [ -z "$(ls -A $BOOKDIR)" ]; then
   echo "Start initializing book..."
   gitbook init $BOOKDIR
fi

#if the are no arguments it start to serve the book as default action
if [ $# -eq 0 ]; then
    echo "Start serving book $BOOKDIR..."
    gitbook serve $BOOKDIR
else
    gitbook $@
fi

