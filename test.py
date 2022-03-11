#!/usr/bin/env python3
import tika
tika.initVM()
from tika import parser
parsed = parser.from_file('test.txt')
print(parsed["metadata"])
