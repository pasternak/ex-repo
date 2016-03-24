%w( epel-release nginx ).each {|pkg| package pkg }

template "/etc/nginx/conf.d/load-balancer.conf" do
  source "load-balancer.conf.erb"
  owner "nginx"
  group "nginx"
  mode 0640
  notifies :reload, "service[nginx]", :delayed
end

# Cookbook File resource
cookbook_file "/etc/nginx/nginx.conf" do
  group "nginx"
  mode 0640
  owner "nginx"
  source "nginx.conf"
  notifies :reload, "service[nginx]", :delayed
end

# Service resource
service "nginx" do
  action [:enable, :start ]
end

