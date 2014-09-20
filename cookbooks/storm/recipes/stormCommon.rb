package "supervisor" do
	action :install
end

package "storm" do
	action :install
end

template "/etc/storm/conf/storm.yaml" do
	source "storm.yaml.erb"
	owner "storm"
	group "storm"
	mode "0644"
end
