import socket as sk
ip = input("Enter ipv4 addr (nnn.nnn.nnn.nnn) to scan: ")
port_low = int(input("Enter port low / to begin from: "))
port_high = int(input("Enter port high / to end from: "))
port_range = port_high - port_low

for port in range(port_range):
    print('...%d' %(port))      
    try:
        s=sk.socket(sk.AF_INET,sk.SOCK_STREAM)
        s.settimeout(1000)
        s.connect((ip,port))
        print('%d:OPEN' %(port))
        s.close
    except: continue
