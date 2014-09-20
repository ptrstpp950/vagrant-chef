include_recipe "storm::stormCommon"

template "/etc/supervisord.d//supervisord-storm-nimbus.ini" do
	source "supervisord-storm-nimbus.ini"
	owner "root"
	group "root"
	mode "0644"
end

service "supervisord" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :restart ]
end
