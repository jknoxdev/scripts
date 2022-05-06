import socket as sk
import random
ip = input("Enter ipv4 addr (nnn.nnn.nnn.nnn) to scan: ")
port_low = int(input("Enter port low / to begin from: "))
port_high = int(input("Enter port high / to end from: "))
port_range = port_high - port_low
offset_low = int(input("offset low (ms): "))
offset_high = int(input("offset high (ms): "))

print(random.randrange(1,10))


for port in range(port_range):   
#    print('trying port..%d' + str(port) + 'at ' + str(ip))
    offset = random.randrange(offset_low,offset_high)
    print("trying port {port} at {ip} on offset {offset}".format(port=port, ip=ip, offset=offset))
    try:
        s=sk.socket(sk.AF_INET,sk.SOCK_STREAM)
        s.settimeout(offset)
        s.connect((ip,port))
        print('%d:OPEN' %(port))
        s.close
    except: continue
