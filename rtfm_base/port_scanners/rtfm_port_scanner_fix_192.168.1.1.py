import socket as sk
for port in range (1,1024):
    try:
        s=sk.socket(sk.AF_INET,sk.SOCK_STREAM)
        s.settimeout(1000)
        s.connect(('192.168.1.1',port))
        print('%d:OPEN' %(port))
        s.close
    except: continue
