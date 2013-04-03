if ['app_master', 'app', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app_name, data|
    template "/data/#{app_name}/shared/config/env.custom" do
      source "env.custom.erb"
      owner node[:owner_name]
      group node[:owner_name]
      mode 0755
      backup 0
      notifies :restart, resources(:service => "nginx"), :delayed
    end
  end
end