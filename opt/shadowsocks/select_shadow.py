from __future__ import unicode_literals
from copy import copy
import os
import json
import random
import telnetlib

def main():
    conf_path= os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "config.json")
    with open(conf_path) as config_fil:
        configs = json.loads(config_fil.read())
    pools = copy(configs['pool'])
    random.shuffle(pools)
    for pool in pools:
        host, port = pool.split(':')
        port = int(port)
        tn = telnetlib.Telnet()
        try:
            tn.open(host, port, 3)
            tn.close()
        except:
            continue
        print host
        break

    configs['server_port'] = port
    configs['server'] = host

    with open(conf_path, 'w') as config_fil:
        json.dump(configs, config_fil, indent=4)


if __name__ == '__main__':
    main()