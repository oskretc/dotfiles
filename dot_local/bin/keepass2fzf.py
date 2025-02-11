
from passhole.passhole import open_database
# from operator import attrgetter as ag
kp = open_database()

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

for e in kp.entries:
    
    print(f"{e.group}::{bcolors.OKCYAN+e.title+ bcolors.ENDC}::{e.username}::{e.password}::")


 

