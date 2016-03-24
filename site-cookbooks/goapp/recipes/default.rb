package "golang"

cookbook_file "/etc/systemd/system/test.service"

cookbook_file "/usr/local/bin/test.go" do
  source "app.go"
end

service "test" do
  action [ :enable, :start ]
end
