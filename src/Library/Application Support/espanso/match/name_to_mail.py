#!/usr/bin/env python3
import sys

name = sys.argv[1]
firstname, lastname = name.split(" ")
print(f"{firstname}.{lastname}@iis.fraunhofer.de")
