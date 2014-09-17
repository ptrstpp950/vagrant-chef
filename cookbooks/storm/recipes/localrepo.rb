script "disable all yum repos" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code <<-EOH
		mkdir -p /etc/yum.repos.d/disabled
		mv -f /etc/yum.repos.d/*.repo /etc/yum.repos.d/disabled/;
	EOH
end

template "/etc/yum.repos.d/local-vagrant.repo" do
	source "local-vagrant.repo"
	owner "root"
	group "root"
	mode "0644"
end
