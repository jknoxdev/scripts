import socket as sk
ip = input("Enter ipv4 addr (nnn.nnn.nnn.nnn) to scan: ")
port_low = ("Enter port low / to begin from: ")
port_high = ("Enter port high / to end from: ")
for port in range (port_low,port_high):
    try:
        s=sk.socket(sk.AF_INET,sk.SOCK_STREAM)
        s.settimeout(1000)
        s.connect((ip,port))
        print('%d:OPEN' %(port))
        s.close
    except: continue
