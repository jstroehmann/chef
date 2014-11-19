#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, JaymzDotOrg
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
	action :install
end

node.default["apache"]["indexfile"] = "index2.html"

cookbook_file node["apache"]["serverfile"] do
	source node["apache"]["indexfile"]
	mode "0644"
end

service "httpd" do
	action [:enable, :start]
end
