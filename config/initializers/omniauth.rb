Rails.application.config.middleware.use OmniAuth::Builder do
  puts "WHOOOOOO"
  provider :twitter, "OvewcARD3k0MT9bCooAubPz3z", "60MT2zJFgJ0K6Ydc0dAnS4mp4uoYO6XUrvVoelB3ZTEbreFdvK"
   {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end 