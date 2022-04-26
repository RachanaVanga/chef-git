#
# Cookbook:: log_upload
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Upload to Gitlab package manager 


bash 'Upload log file' do
    code <<-EOH
    curl --header "PRIVATE-TOKEN: #{node['log_upload']['access_token']}" \
     --upload-file path/to/log.yml \
     "https://gitlab.example.com/api/v4/projects/newrelic/logconfig/#{node['environment']}/#{node['hostname']}/log.yml"
    EOH
    action :run
end

# line 13 and  14 needs modifications 