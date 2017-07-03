#!/bin/bash
aptitude search ~i | egrep -v '^i A '|wc -l