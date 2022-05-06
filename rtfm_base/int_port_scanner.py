import socket as sk
ip = input("Enter ipv4 addr (nnn.nnn.nnn.nnn) to scan syslevel (1-1024) ports: ")
for port in range (1,1024):
    try:
        s=sk.socket(sk.AF_INET,sk.SOCK_STREAM)
        s.settimeout(1000)
        s.connect((ip,port))
        print('%d:OPEN' %(port))
        s.close
    except: continue
