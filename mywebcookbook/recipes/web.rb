#
# Cookbook Name:: mywebcookbook
# Recipe:: web
# Copyright (c) 2016 Sam Abiodun, All Rights Reserved.

# Install and start apache service
httpd_service 'mystaticweb' do
    mpm 'prefork'
    action [:create, :start]
end

# Add the site configuration
http_config 'mystaticweb' do
    instance 'mystaticweb'
    source 'web.rb'
    notifies :restart, 'httpd_service[mystaticweb]'
end

# Create document root
directory node['mystaticweb']['document_root'] do
    recursive true
end

# Write homepage to display Hello World message

file "#{node['mystaticweb']['document_root']}/index.html" do
    content '<html>
                <head>
                     <title>Hello World</title>
                </head>
                <body>
                    <h1>Hello World!</h1>
                </body>
            </html>'
    mode '0644'
 end

