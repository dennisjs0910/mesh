Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'F24Pacf6CN7o1gH9E4turYnDz', 'LoFVLjRIpKMdmq0hmoeslLSEgV8qCqdrZi6SvZdJH6lnUvIV9c'
  provider :instagram, 'b3d6f75cc55946d193ad37d0395356fa','9c592f5c2e004a48893c7636b6e585e4'
  provider :facebook, '796159457094447', '7934718fc4f8b565c7e3cda6fcbd4151'
  provider :soundcloud, '31b35595e00750bf40213344343e81f1', '39613d98981c264e14dcbd8dead5896f'
end