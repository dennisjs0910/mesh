Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "0puWhU9g2RzQSAZPjPzR851yY", "787QfwNIYIPcBTaSd9Fpm2E4D4z5pnxpy7LfAU44fUxYgFsJAs"
   {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end 