#!/bin/bash

sudo rm -r ~/kivy_venv
python3 -m pip uninstall kivy[base] kivy_examples
echo "Successfully Uninstalled Kivy"
