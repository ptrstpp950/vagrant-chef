package "zookeeper" do
	action :install
end

nodes = node[:zookeeper][:nodes].split(",")
ip = node[:network][:interfaces][node[:zookeeper][:eth]][:addresses].detect{|k,v| v[:family] == "inet" }.first
log "current node ip= "+ip

node_index = Hash[nodes.map.with_index.to_a][ip]+1

log "current node index= "+node_index.to_s()

template "/etc/zookeeper/conf/zoo.cfg" do
	source "zoo.cfg.erb"
	mode "0755"
	variables({
      :nodes => nodes,
      :index=> node_index
    })
end

template "/var/lib/zookeeper/myid" do
  mode "0755"
  source "myid.erb"
  variables({
      :index=> node_index
    })
end

template "/etc/init.d/zookeeper" do
	source "zookeeper.initd"
	owner "root"
	group "root"
	mode "0755"
end

service "zookeeper" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :restart ]
end

