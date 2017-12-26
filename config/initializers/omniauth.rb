OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '2025250254366474' , 'b01e5eb5a5593808ad003ac4407e8963'
end
