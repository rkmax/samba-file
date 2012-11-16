#
# Cookbook Name:: samba-file
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
include_recipe "apt"


%w{samba samba-tools}.each do |pgk|
    package pgk do
        action :install
    end
end

template "/etc/samba/smb.conf" do
    source "smb.conf.erb"
    variables(
        :workgroup => "SAMBA",
        :realm => "SAMBA.COM",
        :server_string => "File server",
        :netbios_name => "SAMBA-FILE-SERVER",
        :security => "ads",
        :template_homedir => "/home/%D/%U",
        :shares => []
    )
    notifies :restart, "service[smbd]"
end

service "smbd" do
    action [:enable, :start]
end
