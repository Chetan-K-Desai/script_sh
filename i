#!/bin/bash

ip r | sed '1,2d' | cut -d " " -f 9
