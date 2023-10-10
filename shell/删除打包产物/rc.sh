#!/bin/bash

pwd=$(pwd)

echo "当前执行目录 $pwd"

function remove() {
  if [ -d "$1/node_modules" ]; then
    rm -rf $1/node_modules
    echo "已删除 $1/node_modules."
  fi

  if [ -d "$1/dist" ]; then
    rm -rf $1/dist
    echo "已删除 $1/dist."
  fi

  if [ -d "$1/lib" ]; then
    rm -rf $1/lib
    echo "已删除 $1/lib."
  fi

  if [ -d "$1/es" ]; then
    rm -rf $1/es
    echo "已删除 $1/es."
  fi

  if [ -f "$1/yarn.lock" ]; then
    rm $1/yarn.lock
    echo "已删除 yarn.lock."
  fi

  if [ -f "$1/package-lock.json" ]; then
    rm $1/package-lock.json
    echo "已删除 package-lock.json."
  fi
}

remove $pwd

if [ -d "$pwd/packages" ]; then
  for dir in $pwd/packages/*; do
    echo $dir
    if [ -d $dir ]; then
      remove $dir
    fi
  done
fi