Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'F24Pacf6CN7o1gH9E4turYnDz', 'LoFVLjRIpKMdmq0hmoeslLSEgV8qCqdrZi6SvZdJH6lnUvIV9c'
  provider :instagram, 'b3d6f75cc55946d193ad37d0395356fa','9c592f5c2e004a48893c7636b6e585e4', :scope => 'basic likes'
  provider :facebook, '383367571788257', '61a0a4c317af1acca95e5add55472334'
  provider :soundcloud, '31b35595e00750bf40213344343e81f1', '39613d98981c264e14dcbd8dead5896f'
  provider :reddit, 'vOsw4t8ygEHS2Q', 'HjbN35t4g7oOPW0wCp5hBRadTmc', :scope => 'identity,read,vote'
end