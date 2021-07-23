#!/usr/bin/python

from pathlib import Path
from PyInquirer import prompt, Separator
import sys
import argparse
import configparser
import random
import string
import getpass
import time
import os

CONFIG_TEMPLATE = 'sophos_attack_range.conf.template'

def load_config_template(CONFIG_TEMPLATE):
    settings = {}
    config = configparser.RawConfigParser()
    config.read(CONFIG_TEMPLATE)
    return config
    