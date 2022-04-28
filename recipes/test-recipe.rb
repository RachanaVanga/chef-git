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


# download aws file 

bash 'aws download' do
    code <<-EOH
    /usr/local/bin/aws s3 cp  s3://gitlabtest12345/upload /tmp/downloaded
    EOH
    action :run
    user 'root'
end




# new curl reference


bash 'upload file' do
    cwd '/tmp'
    code <<-EOH
    curl -H 'PRIVATE-TOKEN: ****' \
    -H "Content-Type: application/json" \
    -d '{
       "branch": "master", 
       "author_email": "johndoe@gmail.com", 
       "author_name": "John Doe",
       "content": '"$(jq -Rs '.' upload)"', 
       "commit_message": "create a new file"
    }' "https://gitlab.com/api/v4/projects/26197037/repository/files/upload"
    EOH
    user 'root'
    action :run
end