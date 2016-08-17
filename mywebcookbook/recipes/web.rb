#
# Cookbook Name:: awesome_customers_ubuntu
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
#

# Install Apache and start the service
#
httpd_service 'customers' do
    mpm 'prefork'
    action [:create, :start]
end

# Add the site configuration
http_config 'customers' do
    instance 'customers'
    source 'customers.conf.erb'
    notifies :restart, 'httpd_service[customers]'
end

# Create document root
directory node['awesome_customers_ubuntu']['document_root'] do
    recursive true
end



# Write the home page

file "#{node['awesome_customers_ubuntu']['document_root']}/index.html" do
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

