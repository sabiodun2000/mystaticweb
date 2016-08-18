#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright (c) 2016 Sam Abidoun, All Rights Reserved.

template '/etc/update-motd.d/98-server-info' do
	source 'server-info.erb'
	mode '0755'
end

