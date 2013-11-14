#!/usr/bin/python

#import keyring
import sys
import subprocess
import os

def get_user(account):
  ret = subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -u " + account + " | sed -n '/^[^ ]*$/p'"], shell=True).strip()
  print("user: " + ret)
  return ret

def get_password(account):
  ret = subprocess.check_output(["echo $PWSAFEPASSWORD | pwsafe -E -q -p " + account + " | sed -n '/^[^ ]*$/p'"], shell=True).strip()
  print("pass: " + ret)
  return ret

# echo "$PASSWORD" | gpg --use-agent -e > ~/.passwd/$ACCOUNT.gpg

def mailpassword(account):
  account = os.path.basename(account)
  home = os.getenv("HOME")
  path = "%s/.passwd/%s.gpg" % (home, account)
  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
  try:
    return subprocess.check_output(args).strip()
  except subprocess.CalledProcessError:
    return ""

def prime_gpg_agent():
  ret = False
  i = 1
  while not ret:
    ret = (mailpassword("prime") == "prime")
    if i > 2:
      sys.stderr.write("Error reading passwords.")
    i += 1
  return ret

prime_gpg_agent()

