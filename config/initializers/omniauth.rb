Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'F24Pacf6CN7o1gH9E4turYnDz', 'LoFVLjRIpKMdmq0hmoeslLSEgV8qCqdrZi6SvZdJH6lnUvIV9c'
  provider :instagram, 'b3d6f75cc55946d193ad37d0395356fa','9c592f5c2e004a48893c7636b6e585e4'
end