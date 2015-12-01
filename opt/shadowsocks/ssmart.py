import pycurl
from io import BytesIO
import logging
import os
import json
import signal
import subprocess
import shutil
import time
import random

logger = logging.getLogger(__name__)
consoleHandler = logging.StreamHandler()
logFormatter = logging.Formatter("%(asctime)s [%(levelname)-5.5s]  %(message)s")
consoleHandler.setFormatter(logFormatter)
logger.addHandler(consoleHandler)
logger.setLevel(logging.INFO)



#   # Send the signal to all the process groups
def check_connection():
    logger.info("Start requesting http://www.google.com.")
    try:
        buffer = BytesIO()
        c = pycurl.Curl()
        c.setopt(pycurl.URL, 'http://www.google.com')
        c.setopt(pycurl.PROXY, 'localhost')
        c.setopt(pycurl.PROXYPORT, 1080)
        c.setopt(pycurl.PROXYTYPE, pycurl.PROXYTYPE_SOCKS5)
        c.setopt(c.WRITEDATA, buffer)
        c.setopt(pycurl.TIMEOUT_MS, 10000)
        c.perform()
        c.close()
    except pycurl.error as e:
        logger.error(e, exc_info=True)
        return False
    logger.info("Finish requesting http://www.google.com.")
    return True

def switch_server():
    config_fil_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "config.json")
    with open(config_fil_path) as config_fil:
        configs = json.loads(config_fil.read())

    old_server = configs['server']

    server_infos = configs['server_password']

    server, password, method = random.choice(server_infos)
    host, port = server.split(':')
    configs['server'] = host
    configs['server_port'] = port
    configs['password'] = password
    configs['method'] = method

    logger.warning('Switching from {} to {}.'.format(old_server, server))

    shutil.copy2(config_fil_path, config_fil_path + '.bak')
    with open(config_fil_path, 'w') as config_fil:
        config_fil.write(json.dumps(configs, indent=4))


def main():
    ss_process = None
    try:
        while True:
            if check_connection():
                time.sleep(60)
            else:
                if ss_process:
                    os.killpg(ss_process.pid, signal.SIGTERM)
                switch_server()
                ss_process = subprocess.Popen("sslocal", stdout=subprocess.PIPE,
                                shell=True, preexec_fn=os.setsid)
                time.sleep(10)
    except KeyboardInterrupt:
        if ss_process:
            os.killpg(ss_process.pid, signal.SIGTERM)
        return

if __name__ == '__main__':
    main()
