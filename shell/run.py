# python3 ./run.py

import sys

# Add sys.path
sys.path.insert(0, '../src_py3')
from dmisc import *


def main(args):
    """
    :arg1: str; path to dub
    :arg ... : optional, further input pathes

    Example:
        $ python3 run.py "/home/dave/.dub/packages/"
    """

    # set your own path to dub
    dub_path = sys.argv[1]

    # set your own standard library imports
    std_imports = None if len(sys.argv) <= 2 else sys.argv[2:]

    dmd_imports = generate_dmd_config(dub_path, std_imports)
    dcd_imports = generate_dcd_config(dub_path, std_imports)

    with open('../output/copy2_dmd.config', 'w') as file:
        file.write(dmd_imports)
    with open('../output/copy2_dcd.config', 'w') as file:
        file.write(dcd_imports)

    print(dmd_imports)


if __name__ == '__main__':
    main(sys.argv)
