# Primary DNS Host
## Network Information
### IP: 10.0.120.80
### DNS: 
- Primary: cci-nspl01.commercecontrols.com

## Application Information
- Adguard Home (https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started)


Cockpit @ port 9090 
Docker w/ Portainer @ port 9001
SSH Allow root login to 10.0.210.0/24
Running Adguard Home @ 10.0.120.80
Running Adguard Sync To: 10.0.120.81



2015 | CCI-IDDL01 | SupaBase w/ appwrite |  | Ubuntu 20.0.4.6LTS | 10.0.120.61 | cci-iddl01.commercecontrols.com | 10055, 9443, 9090, 9000, 8800, 3333, 443, 80, 53, 22 | N/A | Y | Y | Y 

# SupaBase & Appwrite
###### 2015 | CCI-IDDL01
____

## Network Information
- IP: 10.0.120.61
- Internal DNS: cci-iddl01.commercecontrols.com
	-  10.0.120.61:9090 (Cockpit)
	-  10.0.120.61:9443 or 9001
- External DNS: N/A

### Listening Ports
- 10055
- 9443 
- 9090 
- 9000 
- 8800 
- 3333
- 443
- 80
- 53
- 22


| Port #        | Description   | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |
| zebra stripes | are neat      |

# ProxMox Backup Server
###### 110 | CCI-PBPL02
___
## Network Information:
- IP: 10.0.70.19
- InternalFQDN: cci-pbpl02.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 111 | Other Port: 111 |
|  82 | Other Port:  82 |
|  25 | Other Port:  25 |
|  22 | Other Port:  22 |


# Guacamole, java, gnomeshell,
###### 157 | CCI-IAPL01
___
## Network Information:
- IP: 10.0.120.42
- InternalFQDN: cci-iapl01.commercecontrols.com
    - 10.0.120.42+9090 (Cockpit Web Console)
- ExternalFQDN: remote.cci.systems    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9443 | Other Port:  9443 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  9000 | Other Port:  9000 |
|  8090 | Other Port:  8090 |
|  8000 | Other Port:  8000 |
|  5432 | Other Port:  5432 |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Duplicati (stored as a container)
###### 160 | CCI-BUPL01
___
## Network Information:
- IP: 10.0.120.115
- InternalFQDN: cci-bupl01.commercecontrols.com
    -  or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 9001 | Other Port: 9001 |
|  9000 | Other Port:  9000 |
|  8000 | Other Port:  8000 |
|  111 | Other Port:  111 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# RDP Application Host (Soon to be decom'd)
###### 201 | CCI-APPW01
___
## Network Information:
- IP: 10.0.120.8
- InternalFQDN: cci-appw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Primary File Server 
###### 203 | CCI-FPPW01
___
## Network Information:
- IP: 10.0.120.6
- InternalFQDN: cci-fppw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Secondary File Server
###### 1001 | CCI-FPPW02
___
## Network Information:
- IP: 10.0.120.7
- InternalFQDN: cci-fppw02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Primary Sage Server 
###### 1010 | CCI-SGPW02
___
## Network Information:
- IP: 10.0.120.3
- InternalFQDN: cci-sgpw02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Sage Paperless Server 
###### 1012 | CCI-SGPW04
___
## Network Information:
- IP: 10.0.120.5
- InternalFQDN: cci-sgpw04.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# SupaBase w/ appwrite
###### 2015 | CCI-IDDL01
___
## Network Information:
- IP: 10.0.120.61
- InternalFQDN: cci-iddl01.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.61+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9443 | Other Port:  9443 |
|  9090 | Other Port:  9090 |
|  9000 | Other Port:  9000 |
|  8800 | Other Port:  8800 |
|  3333 | Other Port:  3333 |
|  443 | HTTPS Port |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# FreeRadius
###### 2021 | CCI-RADPL01
___
## Network Information:
- IP: 10.0.120.35
- InternalFQDN: cci-radpl01.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.35+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9443 | Other Port:  9443 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  8000 | Other Port:  8000 |
|  445 | Other Port:  445 |
|  139 | Other Port:  139 |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Blank Template
###### 2030 | CCI-VPNDB01
___
## Network Information:
- IP: 10.0.120.242
- InternalFQDN: cci-vpndb01.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.242+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 9090 | Other Port: 9090 |
|  9001 | Other Port:  9001 |
|  22 | Other Port:  22 |
|  53 | Other Port:  53 |


# Blank Template
###### 2032 | CCI-VPNDB03
___
## Network Information:
- IP: 10.0.120.244
- InternalFQDN: cci-vpndb03.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.244+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 9090 | Other Port: 9090 |
|  9001 | Other Port:  9001 |
|  22 | Other Port:  22 |
|  53 | Other Port:  53 |


# AdGuard Home/Sync
###### 2051 | CCI-NSPL02
___
## Network Information:
- IP: 10.0.120.81
- InternalFQDN: cci-nspl02.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.81+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Pihole
###### 2110 | CCI-NSPL01
___
## Network Information:
- IP: 10.0.120.210
- InternalFQDN: cci-nspl01.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10050 | Other Port: 10050 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |
|  4711 | Other Port:  4711 |


# Pihole
###### 2112 | CCI-NSPL03
___
## Network Information:
- IP: 10.0.120.212
- InternalFQDN: cci-nspl03.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10050 | Other Port: 10050 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |
|  4711 | Other Port:  4711 |


# Pihole
###### 2114 | CCI-NSPL05
___
## Network Information:
- IP: 10.0.120.214
- InternalFQDN: cci-nspl05.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10050 | Other Port: 10050 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |
|  4711 | Other Port:  4711 |


# Organizr (Stored as a container)
###### 11001 | CCI-APPL01
___
## Network Information:
- IP: 10.0.120.150
- InternalFQDN: cci-aapl01.commercecontrols.com
    -  or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10050 | Other Port: 10050 |
|  9000 | Other Port:  9000 |
|  8000 | Other Port:  8000 |
|  53 | Other Port:  53 |
|  80 | HTTP Port |
|  22 | 45527 | Other Port:  22 | 45527 |


# VaultWarden
###### 11005 | CCI-APPL03
___
## Network Information:
- IP: 10.0.120.162
- InternalFQDN: cci-appl03..commercecontrols.com
    -  or 9001 (Portainer Web Console)
- ExternalFQDN: pw.cci.systems    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10050 | Other Port: 10050 |
|  9000 | Other Port:  9000 |
|  8000 | Other Port:  8000 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | 42683 | Other Port:  22 | 42683 |


# 
###### 11111 | CCI-AMPL02
___
## Network Information:
- IP: 
- InternalFQDN: cci-ampl02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 20108 | CCI-APPL08
___
## Network Information:
- IP: 
- InternalFQDN: cci-appl08.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 30010 | CCI-APPL02
___
## Network Information:
- IP: 
- InternalFQDN: cci-appl02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 30012 | CCI-NMPL02
___
## Network Information:
- IP: 
- InternalFQDN: cci-nmpl02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 30014 | CCI-APPL11
___
## Network Information:
- IP: 
- InternalFQDN: cci-appl11.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 30016 | CCI-DBPL04
___
## Network Information:
- IP: 
- InternalFQDN: cci-dbpl04.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 30018 | CCI-APPL14
___
## Network Information:
- IP: 
- InternalFQDN: cci-appl14.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# 
###### 30020 | CCI-APPL16
___
## Network Information:
- IP: 
- InternalFQDN: cci-appl16.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Guacamole
###### 30022 | CCI-APPL18
___
## Network Information:
- IP: 10.0.120.164
- InternalFQDN: cci-appl18.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.164+9090 (Cockpit Web Console)
- ExternalFQDN: remote.cci.systems    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  53 | Other Port:  53 |
|  22 | 33865 | Other Port:  22 | 33865 |
|  36725 | Other Port:  36725 |


# CCI Git (gitea, mysqld, mariadb)
###### 30024 | CCI-APPL20
___
## Network Information:
- IP: 10.0.120.170
- InternalFQDN: cci-appl20.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.170+9090 (Cockpit Web Console)
- ExternalFQDN: git.cci.systems    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  8022 | Other Port:  8022 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | 45839 | Other Port:  22 | 45839 |


# UpTime Kuma (docker container,node)
###### 30026 | CCI-APPL22
___
## Network Information:
- IP: 10.0.120.172
- InternalFQDN: cci-appl22.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.172+9090 (Cockpit Web Console)
- ExternalFQDN: uptime.cci.systems    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 |40481 | Other Port:  22 |40481 |


# PacketFense (pfqueue, fingerbank-coll)
###### 30029 | CCI-APPL25
___
## Network Information:
- IP: 10.0.120.175
- InternalFQDN: cci-appl25.commercecontrols.com
    - 10.0.120.175+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 22225-4-3-2 | Other Port: 22225-4-3-2 |
|  19999 | Other Port:  19999 |
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
| 8777 | Other Port: 8777 |
|  8125 | Other Port:  8125 |
|  7070 | Other Port:  7070 |
| 6380 | Other Port: 6380 |
| 6379 | Other Port: 6379 |
| 3306 | Other Port: 3306 |
| 2083 | Other Port: 2083 |
| 1444 | Other Port: 1444 |
| 1443 | Other Port: 1443 |
| 1027 | Other Port: 1027 |
| 1025 | Other Port: 1025 |
| 631 | Other Port: 631 |
| 80 | HTTP Port |
| 53 | Other Port: 53 |
| 22 | Other Port: 22 |


# 
###### 30030 | CCI-APPL26
___
## Network Information:
- IP: 
- InternalFQDN: cci-appl26.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Template Host (nothing running)
###### 30032 | CCI-NPDL02
___
## Network Information:
- IP: 10.0.120.231
- InternalFQDN: cci-npdl02.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.231+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9443 | Other Port:  9443 |
|  9090 | Other Port:  9090 |
|  9000 | Other Port:  9000 |
|  8000 | Other Port:  8000 |
|  22 | Other Port:  22 |


# Authentik (gunicorn, ldap, celery, alphine)
###### 30035 | CCI-APPL29
___
## Network Information:
- IP: 10.0.120.220
- InternalFQDN: cci-appl29.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.220+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9300 | Other Port:  9300 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  636 | Other Port:  636 |
|  443 | HTTPS Port |
|  389 | Other Port:  389 |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Nothing running (multiple containers exited 1yr ago)
###### 30036 | CCI-APPL30
___
## Network Information:
- IP: 10.0.120.221
- InternalFQDN: cci-appl30.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.221+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Caddy
###### 30037 | CCI-APPL31
___
## Network Information:
- IP: 10.0.120.222
- InternalFQDN: cci-appl31.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.222+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Postal- runner, rabbitmq, and maria db container
###### 30038 | CCI-APPL32
___
## Network Information:
- IP: 10.0.120.223
- InternalFQDN: cci-appl32.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.223+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9443 | Other Port:  9443 |
|  9090 | Other Port:  9090 |
|  9000 | Other Port:  9000 |
|  8000 | Other Port:  8000 |
|  443 | HTTPS Port |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# Tactical host, mongod, nginx, redis-server
###### 30039 | CCI-APPL33
___
## Network Information:
- IP: 10.0.120.154
- InternalFQDN: cci-appl33.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.120.154+9090 (Cockpit Web Console)
- ExternalFQDN: rmm.cci.systems    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  10000 | Other Port:  10000 |
|  9235 | Other Port:  9235 |
|  9090 | Other Port:  9090 |
|  9001 | Other Port:  9001 |
|  4433 | Other Port:  4433 |
|  4430 | Other Port:  4430 |
|  4222 | Other Port:  4222 |
|  1024 | Other Port:  1024 |
|  443 | HTTPS Port |
|  80 | HTTP Port |
|  53 | Other Port:  53 |
|  22 | Other Port:  22 |


# MYSQL, apache, Snipe
###### 30040 | CCI-AMPL03
___
## Network Information:
- IP: 10.0.121.10
- InternalFQDN: cci-ampl03.commercecontrols.com
    -  or 9001 (Portainer Web Console)
    - 10.0.121.10+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
| 10055 | Other Port: 10055 |
|  9443 | Other Port:  9443 |
|  9090 | Other Port:  9090 |
|  9000 | Other Port:  9000 |
|  8000 | Other Port:  8000 |
|  80 | HTTP Port |
|  22 | Other Port:  22 |


# Virtual Linux Lab 01
###### 30075 | CCI-VLL01
___
## Network Information:
- IP: 10.0.120.104
- InternalFQDN: cci-vll01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Virtual Linux Lab 02
###### 30076 | CCI-VLL02
___
## Network Information:
- IP: 10.0.120.105
- InternalFQDN: cci-vll02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# Virtual Windows Lab
###### 30077 | CCI-VWL01
___
## Network Information:
- IP: 10.0.120.106
- InternalFQDN: cci-vwl01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
| Port #        | Description   |
| ------------- |:-------------:|
|  | Other Port:  |


# ProxMox Backup Server
###### 110 | CCI-PBPL02
___
## Network Information:
- IP: 10.0.70.19

- InternalFQDN: cci-pbpl02.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 111, 82, 25, 22


# GoAccess, Nginx
###### 155 | CCI-WPPL01
___
## Network Information:
- IP: 10.0.120.40

- InternalFQDN: cci-wppl01.commercecontrols.com
    10.0.120.40+:9000 or 9001 (Portainer Web Console)
    10.0.120.40+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 9090, 9001, 9000, 8000, 7880, 3000, 443, 81, 80, 22


# Guacamole, java, gnomeshell,
###### 157 | CCI-IAPL01
___
## Network Information:
- IP: 10.0.120.42

- InternalFQDN: cci-iapl01.commercecontrols.com
    10.0.120.42+9090 (Cockpit Web Console)
- ExternalFQDN: remote.cci.systems    

### Listening Ports
- 10055, 9443, 9090, 9001, 9000, 8090, 8000, 5432, 53, 22


# DUO Authentication Proxy 
###### 158 | CCI-AAPL01
___
## Network Information:
- IP: 10.0.120.43

- InternalFQDN: cci-appl01.commercecontrols.com
    10.0.120.43+:9000 or 9001 (Portainer Web Console)
    10.0.120.43+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9001, 9000, 8000, 53, 22


# Duplicati (stored as a container)
###### 160 | CCI-BUPL01
___
## Network Information:
- IP: 10.0.120.115

- InternalFQDN: cci-bupl01.commercecontrols.com
    10.0.120.115+:9000 or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 9001, 9000, 8000, 111, 80, 53, 22


# 
###### 180 | CCI-WSDW01
___
## Network Information:
- IP: 

- InternalFQDN: cci-wsdw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Windows Domain Controller
###### 200 | CCI-DCPW01
___
## Network Information:
- IP: 10.0.120.2

- InternalFQDN: cci-dcpw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# RDP Application Host (Soon to be decom'd)
###### 201 | CCI-APPW01
___
## Network Information:
- IP: 10.0.120.8

- InternalFQDN: cci-appw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Old SageHost (pending deletion)
###### 202 | CCI-SGPW01
___
## Network Information:
- IP: 

- InternalFQDN: cci-sgpw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Primary File Server 
###### 203 | CCI-FPPW01
___
## Network Information:
- IP: 10.0.120.6

- InternalFQDN: cci-fppw01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 600 | CCI-IPPL01
___
## Network Information:
- IP: 

- InternalFQDN: cci-ippl01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Secondary File Server
###### 1001 | CCI-FPPW02
___
## Network Information:
- IP: 10.0.120.7

- InternalFQDN: cci-fppw02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Secondary App Server 
###### 1002 | CCI-APPW02
___
## Network Information:
- IP: 10.0.120.9

- InternalFQDN: cci-appw02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Primary Sage Server 
###### 1010 | CCI-SGPW02
___
## Network Information:
- IP: 10.0.120.3

- InternalFQDN: cci-sgpw02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Sage MSSQL Server
###### 1011 | CCI-SGPW03
___
## Network Information:
- IP: 10.0.120.4

- InternalFQDN: cci-sgpw03.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Sage Paperless Server 
###### 1012 | CCI-SGPW04
___
## Network Information:
- IP: 10.0.120.5

- InternalFQDN: cci-sgpw04.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Dev_Nuxt 3 and Vuetify with Nodejs
###### 2012 | CCI-IADL01
___
## Network Information:
- IP: 10.0.120.71

- InternalFQDN: cci-iadl01.commercecontrols.com
    10.0.120.71+:9000 or 9001 (Portainer Web Console)
    10.0.120.71+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 24679, 24678, 10055, 9090, 9001, 5440, 3001, 3000, 53, 22


# SupaBase w/ appwrite
###### 2015 | CCI-IDDL01
___
## Network Information:
- IP: 10.0.120.61

- InternalFQDN: cci-iddl01.commercecontrols.com
    10.0.120.61+:9000 or 9001 (Portainer Web Console)
    10.0.120.61+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9000, 8800, 3333, 443, 80, 53, 22


# Min IO w/ Docker
###### 2020 | CCI-WSPL01
___
## Network Information:
- IP: 10.0.120.165

- InternalFQDN: cci-wspl01.commercecontrols.com
    10.0.120.165+:9000 or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 9443, 8080, 8000, 80, 53, 22


# FreeRadius
###### 2021 | CCI-RADPL01
___
## Network Information:
- IP: 10.0.120.35

- InternalFQDN: cci-radpl01.commercecontrols.com
    10.0.120.35+:9000 or 9001 (Portainer Web Console)
    10.0.120.35+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9001, 8000, 445, 139, 53, 22


# 
###### 2022 | CCI-NAPL01
___
## Network Information:
- IP: 10.0.120.36

- InternalFQDN: cci-napl01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Blank Template
###### 2030 | CCI-VPNDB01
___
## Network Information:
- IP: 10.0.120.242

- InternalFQDN: cci-vpndb01.commercecontrols.com
    10.0.120.242+:9000 or 9001 (Portainer Web Console)
    10.0.120.242+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 9090, 9001, 22, 53


# Blank Template
###### 2031 | CCI-VPNDB02
___
## Network Information:
- IP: 10.0.120.243

- InternalFQDN: cci-vpndb02.commercecontrols.com
    10.0.120.243+:9000 or 9001 (Portainer Web Console)
    10.0.120.243+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 9090, 9001, 22, 53


# Blank Template
###### 2032 | CCI-VPNDB03
___
## Network Information:
- IP: 10.0.120.244

- InternalFQDN: cci-vpndb03.commercecontrols.com
    10.0.120.244+:9000 or 9001 (Portainer Web Console)
    10.0.120.244+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 9090, 9001, 22, 53


# AdGuard Home/Sync
###### 2050 | CCI-NSPL01
___
## Network Information:
- IP: 10.0.120.80

- InternalFQDN: cci-nspl01.commercecontrols.com
    10.0.120.80+:9000 or 9001 (Portainer Web Console)
    10.0.120.80+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 80, 53, 22


# AdGuard Home/Sync
###### 2051 | CCI-NSPL02
___
## Network Information:
- IP: 10.0.120.81

- InternalFQDN: cci-nspl02.commercecontrols.com
    10.0.120.81+:9000 or 9001 (Portainer Web Console)
    10.0.120.81+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 80, 53, 22


# Adguard Home/Sync
###### 2052 | CCI-NSPL03
___
## Network Information:
- IP: 10.0.120.82

- InternalFQDN: cci-nspl03.commercecontrols.com
    10.0.120.82+:9000 or 9001 (Portainer Web Console)
    10.0.120.82+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090,9001, 80, 53, 22


# Pihole
###### 2110 | CCI-NSPL01
___
## Network Information:
- IP: 10.0.120.210

- InternalFQDN: cci-nspl01.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 80, 53, 22, 4711


# Pihole
###### 2111 | CCI-NSPL02
___
## Network Information:
- IP: 10.0.120.211

- InternalFQDN: cci-nspl02.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 80, 53, 22, 4711


# Pihole
###### 2112 | CCI-NSPL03
___
## Network Information:
- IP: 10.0.120.212

- InternalFQDN: cci-nspl03.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 80, 53, 22, 4711


# Pihole
###### 2113 | CCI-NSPL04
___
## Network Information:
- IP: 10.0.120.213

- InternalFQDN: cci-nspl04.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 80, 53, 22, 4711


# Pihole
###### 2114 | CCI-NSPL05
___
## Network Information:
- IP: 10.0.120.214

- InternalFQDN: cci-nspl05.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 80, 53, 22, 4711


# Pihole
###### 2115 | CCI-NSPL06
___
## Network Information:
- IP: 10.0.120.215

- InternalFQDN: cci-nspl06.commercecontrols.com
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 80, 53, 22, 4711


# OpenVPN, Pritunl, mongod
###### 2201 | CCI-VPNI01
___
## Network Information:
- IP: 10.0.120.240

- InternalFQDN: cci-vpni01.commercecontrols.com
- ExternalFQDN: vpn.cci.systems    

### Listening Ports
- 10050, 443, 53, 80, 22 | 33471, 27017, 2302


# Organizr (Stored as a container)
###### 11001 | CCI-APPL01
___
## Network Information:
- IP: 10.0.120.150

- InternalFQDN: cci-aapl01.commercecontrols.com
    10.0.120.150+:9000 or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 9000, 8000, 53, 80, 22 | 45527


# VaultWarden
###### 11005 | CCI-APPL03
___
## Network Information:
- IP: 10.0.120.162

- InternalFQDN: cci-appl03..commercecontrols.com
    10.0.120.162+:9000 or 9001 (Portainer Web Console)
- ExternalFQDN: pw.cci.systems    

### Listening Ports
- 10050, 9000, 8000, 80, 53, 22 | 42683


# TrueCommand ("exited" for 19 months)
###### 11009 | CCI-APPL07
___
## Network Information:
- IP: 10.0.120.19

- InternalFQDN: cci-appl07.commercecontrols.com
    10.0.120.19+:9000 or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10050, 9000, 8000, 53, 22 | 44801


# 
###### 11111 | CCI-AMPL02
___
## Network Information:
- IP: 

- InternalFQDN: cci-ampl02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Knowledgebase, MYSQL, 
###### 11143 | CCI-KBPL02
___
## Network Information:
- IP: 10.0.120.161

- InternalFQDN: cci-kbpl02.commercecontrols.com
    10.0.120.161+:9000 or 9001 (Portainer Web Console)
    10.0.120.161+9090 (Cockpit Web Console)
- ExternalFQDN: kb.cci.systems    

### Listening Ports
- 9090, 9001, 3306, 80, 53, 22 | 36314, 39685


# 
###### 20108 | CCI-APPL08
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl08.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 20109 | CCI-APPL09
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl09.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30010 | CCI-APPL02
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30011 | CCI-RTPL01
___
## Network Information:
- IP: 

- InternalFQDN: cci-rtpl01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30012 | CCI-NMPL02
___
## Network Information:
- IP: 

- InternalFQDN: cci-nmpl02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30013 | CCI-APPL10
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl10.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30014 | CCI-APPL11
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl11.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30015 | CCI-APPL12
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl12.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30016 | CCI-DBPL04
___
## Network Information:
- IP: 

- InternalFQDN: cci-dbpl04.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30018 | CCI-APPL14
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl14.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30019 | CCI-APPL15
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl15.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30020 | CCI-APPL16
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl16.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# 
###### 30021 | CCI-APPL17
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl17.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Guacamole
###### 30022 | CCI-APPL18
___
## Network Information:
- IP: 10.0.120.164

- InternalFQDN: cci-appl18.commercecontrols.com
    10.0.120.164+:9000 or 9001 (Portainer Web Console)
    10.0.120.164+9090 (Cockpit Web Console)
- ExternalFQDN: remote.cci.systems    

### Listening Ports
- 10055, 9090, 9001, 53, 22 | 33865, 36725


# Remotely (docker container)
###### 30023 | CCI-APPL19
___
## Network Information:
- IP: 10.0.120.169

- InternalFQDN: cci-appl19.commercecontrols.com
    10.0.120.169+:9000 or 9001 (Portainer Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9001, 80, 53, 22 | 43613


# CCI Git (gitea, mysqld, mariadb)
###### 30024 | CCI-APPL20
___
## Network Information:
- IP: 10.0.120.170

- InternalFQDN: cci-appl20.commercecontrols.com
    10.0.120.170+:9000 or 9001 (Portainer Web Console)
    10.0.120.170+9090 (Cockpit Web Console)
- ExternalFQDN: git.cci.systems    

### Listening Ports
- 10055, 9090, 9001, 8022, 80, 53, 22 | 45839


# OpenTogetherTube (node, redis-server)
###### 30025 | CCI-APPL21
___
## Network Information:
- IP: 10.0.120.171

- InternalFQDN: cci-appl21.commercecontrols.com
    10.0.120.171+:9000 or 9001 (Portainer Web Console)
    10.0.120.171+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 8080, 80, 53, 22 | 37637, 5432


# UpTime Kuma (docker container,node)
###### 30026 | CCI-APPL22
___
## Network Information:
- IP: 10.0.120.172

- InternalFQDN: cci-appl22.commercecontrols.com
    10.0.120.172+:9000 or 9001 (Portainer Web Console)
    10.0.120.172+9090 (Cockpit Web Console)
- ExternalFQDN: uptime.cci.systems    

### Listening Ports
- 10055, 9090, 9001, 80, 53, 22 |40481


# 
###### 30028 | CCI-APPL24
___
## Network Information:
- IP: (initramfs)

- InternalFQDN: cci-appl24.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# PacketFense (pfqueue, fingerbank-coll)
###### 30029 | CCI-APPL25
___
## Network Information:
- IP: 10.0.120.175

- InternalFQDN: cci-appl25.commercecontrols.com
    10.0.120.175+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 22225-4-3-2, 19999,10055, 9090,8777, 8125, 7070,6380,6379,3306,2083,1444,1443,1027,1025,631,80,53,22


# 
###### 30030 | CCI-APPL26
___
## Network Information:
- IP: 

- InternalFQDN: cci-appl26.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# AdGuard Home/Sync (container) NxFilter
###### 30031 | CCI-NPDL01
___
## Network Information:
- IP: 10.0.120.230

- InternalFQDN: cci-npdl01.commercecontrols.com
    10.0.120.230+:9000 or 9001 (Portainer Web Console)
    10.0.120.230+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9000, 8080, 8000, 80, 53, 22


# Template Host (nothing running)
###### 30032 | CCI-NPDL02
___
## Network Information:
- IP: 10.0.120.231

- InternalFQDN: cci-npdl02.commercecontrols.com
    10.0.120.231+:9000 or 9001 (Portainer Web Console)
    10.0.120.231+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9000, 8000, 22


# Apprise (exited 16 months ago)
###### 30033 | CCI-APPL27
___
## Network Information:
- IP: 10.0.120.177

- InternalFQDN: cci-appl27.commercecontrols.com
    10.0.120.177+:9000 or 9001 (Portainer Web Console)
    10.0.120.177+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 9090, 9001, 53, 22 


# Zabbix (mariadb)
###### 30034 | CCI-APPL28
___
## Network Information:
- IP: 10.0.120.163

- InternalFQDN: cci-appl28.commercecontrols.com
    10.0.120.163+:9000 or 9001 (Portainer Web Console)
    10.0.120.163+9090 (Cockpit Web Console)
- ExternalFQDN: monitor.cci.system    

### Listening Ports
- 10055, 10051, 9090, 9001, 4369, 80, 53, 22


# Authentik (gunicorn, ldap, celery, alphine)
###### 30035 | CCI-APPL29
___
## Network Information:
- IP: 10.0.120.220

- InternalFQDN: cci-appl29.commercecontrols.com
    10.0.120.220+:9000 or 9001 (Portainer Web Console)
    10.0.120.220+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9300, 9090, 9001, 636, 443, 389, 80, 53, 22


# Nothing running (multiple containers exited 1yr ago)
###### 30036 | CCI-APPL30
___
## Network Information:
- IP: 10.0.120.221

- InternalFQDN: cci-appl30.commercecontrols.com
    10.0.120.221+:9000 or 9001 (Portainer Web Console)
    10.0.120.221+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 53, 22


# Caddy
###### 30037 | CCI-APPL31
___
## Network Information:
- IP: 10.0.120.222

- InternalFQDN: cci-appl31.commercecontrols.com
    10.0.120.222+:9000 or 9001 (Portainer Web Console)
    10.0.120.222+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 53, 22


# Postal- runner, rabbitmq, and maria db container
###### 30038 | CCI-APPL32
___
## Network Information:
- IP: 10.0.120.223

- InternalFQDN: cci-appl32.commercecontrols.com
    10.0.120.223+:9000 or 9001 (Portainer Web Console)
    10.0.120.223+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9000, 8000, 443, 80, 53, 22


# Tactical host, mongod, nginx, redis-server
###### 30039 | CCI-APPL33
___
## Network Information:
- IP: 10.0.120.154

- InternalFQDN: cci-appl33.commercecontrols.com
    10.0.120.154+:9000 or 9001 (Portainer Web Console)
    10.0.120.154+9090 (Cockpit Web Console)
- ExternalFQDN: rmm.cci.systems    

### Listening Ports
- 10055, 10000, 9235, 9090, 9001, 4433, 4430, 4222, 1024, 443, 80, 53, 22


# MYSQL, apache, Snipe
###### 30040 | CCI-AMPL03
___
## Network Information:
- IP: 10.0.121.10

- InternalFQDN: cci-ampl03.commercecontrols.com
    10.0.121.10+:9000 or 9001 (Portainer Web Console)
    10.0.121.10+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9443, 9090, 9000, 8000, 80, 22


# mongod, java, Docker, dynfi
###### 30041 | CCI-APPL34
___
## Network Information:
- IP: 10.0.120.178

- InternalFQDN: cci-appl34.commercecontrols.com
    10.0.120.178+:9000 or 9001 (Portainer Web Console)
    10.0.120.178+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 8080, 53, 22


# Virtual Linux Lab 01
###### 30075 | CCI-VLL01
___
## Network Information:
- IP: 10.0.120.104

- InternalFQDN: cci-vll01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Virtual Linux Lab 02
###### 30076 | CCI-VLL02
___
## Network Information:
- IP: 10.0.120.105

- InternalFQDN: cci-vll02.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Virtual Windows Lab
###### 30077 | CCI-VWL01
___
## Network Information:
- IP: 10.0.120.106

- InternalFQDN: cci-vwl01.commercecontrols.com
- ExternalFQDN:     

### Listening Ports
- 


# Portainer/docker Host
###### 30078 | CCI-APPL35
___
## Network Information:
- IP: 10.0.120.90

- InternalFQDN: cci-appl35.commercecontrols.com
    10.0.120.90+:9000 or 9001 (Portainer Web Console)
    10.0.120.90+9090 (Cockpit Web Console)
- ExternalFQDN: N/A    

### Listening Ports
- 10055, 9090, 9001, 8080, 53, 22

