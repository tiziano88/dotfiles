#!/usr/bin/python

#import keyring
import sys
import os
import subprocess

def get_user(account):
  return subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -u " + account + " | sed -n '/^[^ ]*$/p'"], shell=True).strip()

def get_password(account):
  return subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -p " + account + " | sed -n '/^[^ ]*$/p'"], shell=True).strip()
