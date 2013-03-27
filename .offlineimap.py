#!/usr/bin/python

import keyring
import sys
import os
import subprocess

def get_user(account):
  return subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -u " + account + " | tail -n 1"], shell=True).strip()

def get_password(account):
  return subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -p " + account + " | tail -n 1"], shell=True).strip()
