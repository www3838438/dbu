[fwBasic]
status = enabled
incoming = deny
outgoing = allow
routed = disabled

[Rule0]
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

[Rule1]
ufw_rule = 52944 ALLOW IN Anywhere
description = Bittorrent IN 52944
command = /usr/sbin/ufw allow in from any to any port 52944
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 52944
iface = 
routed = 
logging = 

[Rule2]
ufw_rule = 137,138/udp ALLOW IN Anywhere
description = SAMBA IN
command = /usr/sbin/ufw allow in proto udp from any to any port 137,138
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule3]
ufw_rule = 139,445/tcp ALLOW IN Anywhere
description = SAMBA IN
command = /usr/sbin/ufw allow in proto tcp from any to any port 139,445
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule4]
ufw_rule = 5353/udp ALLOW IN Anywhere
description = Avahi/mDNS
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule5]
ufw_rule = 5353/udp ALLOW OUT Anywhere (out)
description = Avahi/mDNS
command = /usr/sbin/ufw allow out proto udp from any to any port 5353
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule6]
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

[Rule7]
ufw_rule = 52944 (v6) ALLOW IN Anywhere (v6)
description = Bittorrent IN 52944
command = /usr/sbin/ufw allow in from any to any port 52944
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 52944
iface = 
routed = 
logging = 

[Rule8]
ufw_rule = 137,138/udp (v6) ALLOW IN Anywhere (v6)
description = SAMBA IN
command = /usr/sbin/ufw allow in proto udp from any to any port 137,138
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule9]
ufw_rule = 139,445/tcp (v6) ALLOW IN Anywhere (v6)
description = SAMBA IN
command = /usr/sbin/ufw allow in proto tcp from any to any port 139,445
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule10]
ufw_rule = 5353/udp (v6) ALLOW IN Anywhere (v6)
description = Avahi/mDNS
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule11]
ufw_rule = 5353/udp (v6) ALLOW OUT Anywhere (v6) (out)
description = Avahi/mDNS
command = /usr/sbin/ufw allow out proto udp from any to any port 5353
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

