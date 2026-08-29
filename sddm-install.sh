#!/bin/bash

# ACLs so sddm user can follow symlinks into home directory
setfacl -m u:sddm:rx ~/

sudo stow -t / sddm
