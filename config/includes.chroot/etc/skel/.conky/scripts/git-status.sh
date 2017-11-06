#!/bin/bash
set -e
source ~/.conky/scripts.conf
cd "$GIT_PATH" && git status -s
