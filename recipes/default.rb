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


%w{samba samba-tool}.each do |pgk|
    package pgk do
        action :install
    end
end
