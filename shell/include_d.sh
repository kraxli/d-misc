# ./include_d.sh

# maybe you need to make the include_d.sh file executable by:
# chmod +x include_d.sh

python3 <<EOF
import sys

# Add sys.path
sys.path.insert(0, '../src_py3')
from dmisc import *

# set your own path to dub
dub_path =  r"/home/dave/.dub/packages/"

# set your own standard library imports
std_imports = None
std_imports = ['/snap/dmd/33/import/phobos']

dmd_imports = generate_dmd_config(dub_path, std_imports)
dcd_imports = generate_dcd_config(dub_path, std_imports)

with open('../output/dmd.conf', 'w') as file:
	  file.write(dmd_imports)

with open('../output/dcd.conf', 'w') as file:
	  file.write(dcd_imports)


print(dmd_imports)

EOF

# python3 -c 'import sys; sys.path.insert(0, "../src_py3"); import dmisc; dub_path =  r"/home/dave/.dub/packages/"; dmisc.generate_dmd_config(dub_path)'
