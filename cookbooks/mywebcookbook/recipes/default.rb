#
# Cookbook Name:: mywebcookbook
# Recipe:: default.rb
#
# Copyright (c) 2016 Sam Abiodun, All Rights Reserved.

# Update apt cache daily

apt_update 'Update the apt cache daily' do
    frequency 86_400
    action :periodic
end


# Install and start Apache - webserver to serve our webpage
package 'apache2'

service 'apache2' do
    supports :status => true
    action [:enable, :start]
end

# Write and display Hello World message as default recipe

template '/var/www/html/index.html' do
    source 'index.html.erb'

end
