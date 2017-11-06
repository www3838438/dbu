#!/bin/bash
amixer sget Master | grep "^  Front" | grep -ow [0-9]*% | head -n 1