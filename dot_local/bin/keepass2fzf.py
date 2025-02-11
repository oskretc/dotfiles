
from passhole.passhole import open_database
# from operator import attrgetter as ag
kp = open_database()

for e in kp.entries:
    
    print(f"{e.group}::{e.title}::{e.username}::{e.password}::")


 

