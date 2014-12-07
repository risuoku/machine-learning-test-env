default[:pip][:get_pip_url] = 'https://bootstrap.pypa.io/get-pip.py'
default[:scikit_learn][:version] = '0.15.0'

default[:user][:name] = 'vagrant'
default[:user][:home] = "/home/#{default[:user][:name]}"
