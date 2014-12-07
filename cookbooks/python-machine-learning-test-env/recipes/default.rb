#
# Cookbook Name:: python-machine-learning-test-env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install utils

template "#{node[:user][:home]}/.vimrc" do
  source "vimrc.erb"
  action :create_if_missing
end

# install python3.x

%w|build-essential python3-dev python3-setuptools 
python3-numpy python3-scipy libatlas-dev libatlas3gf-base|.each do |pkg|
  apt_package pkg do
    action :install
    options "-f --force-yes"
  end
end

# update-alternatives

%w|blas lapack|.each do |p|
  execute "update-alternatives #{p}" do
    command "sudo update-alternatives --set lib#{p}.so.3 /usr/lib/atlas-base/atlas/lib#{p}.so.3"
  end
end

# install pip
execute "install pip" do
  command "curl #{node[:pip][:get_pip_url]} | sudo python3"
end

# install scikit-learn 0.15.0
execute "install scikit-learn" do
  command "sudo pip install \"scikit-learn==#{node[:scikit_learn][:version]}\""
end
