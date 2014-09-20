
#nimbus host
default[:storm][:host]="192.168.33.10"

#zookeeper hosts
default[:zookeeper][:nodes]="192.168.33.10,192.168.33.11"
default[:zookeeper][:eth]="eth1"