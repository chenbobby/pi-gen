#!/usr/bin/env python

import os
import sys
import pathlib


def flash_image_to_disk(image_path: str, device_path: str):
    print("")


def main():
    print("flashing!")
    args = sys.argv
    if len(args) < 2:
        print("Missing arguments IMAGE_PATH and DEVICE_PATH")
        sys.exit(1)
    image_path = pathlib.Path(args[1])

    if len(args) < 3:
        print("Missing argument DEVICE_PATH")
    device_path = pathlib.Path(args[2])

    while True:
        print("Confirm?")
        choice = input()
        if choice in ("y", "yes"):
            flash_image_to_disk(image_path, device_path)
            sys.exit(0)
        elif choice in ("n", "no"):
            print("Aborting operation.")
            sys.exit(1)
        else:
            print("Unexpected input: ", choice)


if __name__ == "__main__":
    main()
