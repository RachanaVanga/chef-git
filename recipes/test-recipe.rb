# to test recipe

file '/tmp/upload.log' do
    content 'test'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

bash 'name' do
    code <<-EOH
    curl --header "PRIVATE-TOKEN: ****" \
    --upload-file "/tmp/upload.log" \
    "https://gitlab.com/api/v4/projects/aravindavvaru/bash-next-steps/uploads"
    EOH
    action :run
end