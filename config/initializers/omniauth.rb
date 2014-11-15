Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'F782ZNqqRvzYGO8krzbG7Fuqj', 'wAlLAX1kliGH8vnwAjBNDAUsdOz7oWfcjepGLQGYhRYLxD7NMj'

  #this gem sucks
end