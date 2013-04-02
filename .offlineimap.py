#!/usr/bin/python

#import keyring
import sys
import subprocess

def get_user(account):
  ret = subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -u " + account + " | sed -n '/^[^ ]*$/p'"], shell=True).strip()
  print("user: " + ret)
  return ret

def get_password(account):
  ret = subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -p " + account + " | sed -n '/^[^ ]*$/p'"], shell=True).strip()
  print("pass: " + ret)
  return ret
