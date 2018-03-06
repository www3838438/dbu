[fwBasic]
status = enabled
incoming = deny
outgoing = deny
routed = disabled

[Rule0]
ufw_rule = 212.211.132.250 80 ALLOW OUT Anywhere (out)
description = security.debian.org.250 HTTP OUT
command = /usr/sbin/ufw allow out from any to 212.211.132.250 port 80
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 212.211.132.250
to_port = 80
iface = 
routed = 
logging = 

[Rule1]
ufw_rule = 212.211.132.32 80 ALLOW OUT Anywhere (out)
description = security.debian.org.32 HTTP OUT
command = /usr/sbin/ufw allow out from any to 212.211.132.32 port 80
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 212.211.132.32
to_port = 80
iface = 
routed = 
logging = 

[Rule2]
ufw_rule = 195.20.242.89 80 ALLOW OUT Anywhere (out)
description = security.debian.org.89 HTTP OUT
command = /usr/sbin/ufw allow out from any to 195.20.242.89 port 80
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 195.20.242.89
to_port = 80
iface = 
routed = 
logging = 

[Rule3]
ufw_rule = 217.196.149.233 80 ALLOW OUT Anywhere (out)
description = security.debian.org.233 HTTP OUT
command = /usr/sbin/ufw allow out from any to 217.196.149.233 port 80
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 217.196.149.233
to_port = 80
iface = 
routed = 
logging = 

[Rule4]
ufw_rule = 993/tcp ALLOW OUT Anywhere (out)
description = IMAPS OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 993
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 993/tcp
iface = 
routed = 
logging = 

[Rule5]
ufw_rule = 143/tcp ALLOW OUT Anywhere (out)
description = IMAP  OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 143
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 143/tcp
iface = 
routed = 
logging = 

[Rule6]
ufw_rule = 50058/tcp ALLOW OUT Anywhere (out)
description = Mumble OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 50058
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 50058/tcp
iface = 
routed = 
logging = 

[Rule7]
ufw_rule = 123/udp ALLOW OUT Anywhere (out)
description = NTP OUT
command = /usr/sbin/ufw allow out proto udp from any to any port 123
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 123/udp
iface = 
routed = 
logging = 

[Rule8]
ufw_rule = 443/tcp ALLOW OUT Anywhere (out)
description = HTTPS OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 443
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 443/tcp
iface = 
routed = 
logging = 

[Rule9]
ufw_rule = 22/tcp ALLOW OUT Anywhere (out)
description = SSH OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 22
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 22/tcp
iface = 
routed = 
logging = 

[Rule10]
ufw_rule = 6697/tcp ALLOW OUT Anywhere (out)
description = IRC SSL OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 6697
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 6697/tcp
iface = 
routed = 
logging = 

[Rule11]
ufw_rule = 823/tcp ALLOW OUT Anywhere (out)
description = SSH 823 OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 823
policy = allow
direction = out
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 823
iface = 
routed = 
logging = 

[Rule12]
ufw_rule = Anywhere ALLOW OUT 52944 (out)
description = Bittorrent 52944 OUT
command = /usr/sbin/ufw allow out from any port 52944 to any
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 52944
to_ip = 
to_port = 
iface = 
routed = 
logging = 

[Rule13]
ufw_rule = 67/udp ALLOW OUT Anywhere (out)
description = DHCP
command = /usr/sbin/ufw allow out proto udp from any to any port 67
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 67/udp
iface = 
routed = 
logging = 

[Rule14]
ufw_rule = 151.101.60.204 80 ALLOW OUT Anywhere (out)
description = debian-fastly.204 HTTP OUT
command = /usr/sbin/ufw allow out from any to 151.101.60.204 port 80
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 151.101.60.204
to_port = 80
iface = 
routed = 
logging = 

[Rule15]
ufw_rule = 151.101.16.204 80 ALLOW OUT Anywhere (out)
description = debian-security-cdn.204
command = /usr/sbin/ufw allow out from any to 151.101.16.204 port 80
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 151.101.16.204
to_port = 80
iface = 
routed = 
logging = 

[Rule16]
ufw_rule = 823/tcp DENY IN Anywhere (log)
description = SSH IN 823/TCP
command = /usr/sbin/ufw deny in log proto tcp from any to any port 823
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 823/tcp
iface = 
routed = 
logging = log

[Rule17]
ufw_rule = 52944 DENY IN Anywhere
description = Bittorrent 52944 IN
command = /usr/sbin/ufw deny in from any to any port 52944
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 52944
iface = 
routed = 
logging = 

[Rule18]
ufw_rule = 53 ALLOW OUT Anywhere (out)
description = DNS OUT
command = /usr/sbin/ufw allow out from any to any port 53
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 53
iface = 
routed = 
logging = 

[Rule19]
ufw_rule = 137,138/udp DENY IN Anywhere
description = SAMBA
command = /usr/sbin/ufw deny in proto udp from any to any port 137,138
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule20]
ufw_rule = 137,138/udp DENY OUT Anywhere (out)
description = SAMBA
command = /usr/sbin/ufw deny out proto udp from any to any port 137,138
policy = deny
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule21]
ufw_rule = 139,445/tcp DENY IN Anywhere
description = SAMBA
command = /usr/sbin/ufw deny in proto tcp from any to any port 139,445
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule22]
ufw_rule = 139,445/tcp DENY OUT Anywhere (out)
description = SAMBA
command = /usr/sbin/ufw deny out proto tcp from any to any port 139,445
policy = deny
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule23]
ufw_rule = 5353/udp DENY IN Anywhere
description = Avahi/mDNS
command = /usr/sbin/ufw deny in proto udp from any to any port 5353
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule24]
ufw_rule = 5353/udp DENY OUT Anywhere (log, out)
description = Avahi/mDNS
command = /usr/sbin/ufw deny out log proto udp from any to any port 5353
policy = deny
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = log

[Rule25]
ufw_rule = 993/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = IMAPS OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 993
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 993/tcp
iface = 
routed = 
logging = 

[Rule26]
ufw_rule = 143/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = IMAP  OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 143
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 143/tcp
iface = 
routed = 
logging = 

[Rule27]
ufw_rule = 50058/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = Mumble OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 50058
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 50058/tcp
iface = 
routed = 
logging = 

[Rule28]
ufw_rule = 123/udp (v6) ALLOW OUT Anywhere (v6) (out)
description = NTP OUT
command = /usr/sbin/ufw allow out proto udp from any to any port 123
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 123/udp
iface = 
routed = 
logging = 

[Rule29]
ufw_rule = 443/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = HTTPS OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 443
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 443/tcp
iface = 
routed = 
logging = 

[Rule30]
ufw_rule = 22/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = SSH OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 22
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 22/tcp
iface = 
routed = 
logging = 

[Rule31]
ufw_rule = 6697/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = IRC SSL OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 6697
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 6697/tcp
iface = 
routed = 
logging = 

[Rule32]
ufw_rule = 823/tcp (v6) ALLOW OUT Anywhere (v6) (out)
description = SSH 823 OUT
command = /usr/sbin/ufw allow out proto tcp from any to any port 823
policy = allow
direction = out
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 823
iface = 
routed = 
logging = 

[Rule33]
ufw_rule = Anywhere (v6) ALLOW OUT 52944 (v6) (out)
description = Bittorrent 52944 OUT
command = /usr/sbin/ufw allow out from any port 52944 to any
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 52944
to_ip = 
to_port = 
iface = 
routed = 
logging = 

[Rule34]
ufw_rule = 67/udp (v6) ALLOW OUT Anywhere (v6) (out)
description = DHCP
command = /usr/sbin/ufw allow out proto udp from any to any port 67
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 67/udp
iface = 
routed = 
logging = 

[Rule35]
ufw_rule = 823/tcp (v6) DENY IN Anywhere (v6) (log)
description = SSH IN 823/TCP
command = /usr/sbin/ufw deny in log proto tcp from any to any port 823
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 823/tcp
iface = 
routed = 
logging = log

[Rule36]
ufw_rule = 52944 (v6) DENY IN Anywhere (v6)
description = Bittorrent 52944 IN
command = /usr/sbin/ufw deny in from any to any port 52944
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 52944
iface = 
routed = 
logging = 

[Rule37]
ufw_rule = 53 (v6) ALLOW OUT Anywhere (v6) (out)
description = DNS OUT
command = /usr/sbin/ufw allow out from any to any port 53
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 53
iface = 
routed = 
logging = 

[Rule38]
ufw_rule = 137,138/udp (v6) DENY IN Anywhere (v6)
description = SAMBA
command = /usr/sbin/ufw deny in proto udp from any to any port 137,138
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule39]
ufw_rule = 137,138/udp (v6) DENY OUT Anywhere (v6) (out)
description = SAMBA
command = /usr/sbin/ufw deny out proto udp from any to any port 137,138
policy = deny
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule40]
ufw_rule = 139,445/tcp (v6) DENY IN Anywhere (v6)
description = SAMBA
command = /usr/sbin/ufw deny in proto tcp from any to any port 139,445
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule41]
ufw_rule = 139,445/tcp (v6) DENY OUT Anywhere (v6) (out)
description = SAMBA
command = /usr/sbin/ufw deny out proto tcp from any to any port 139,445
policy = deny
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule42]
ufw_rule = 5353/udp (v6) DENY IN Anywhere (v6)
description = Avahi/mDNS
command = /usr/sbin/ufw deny in proto udp from any to any port 5353
policy = deny
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule43]
ufw_rule = 5353/udp (v6) DENY OUT Anywhere (v6) (log, out)
description = Avahi/mDNS
command = /usr/sbin/ufw deny out log proto udp from any to any port 5353
policy = deny
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = log

