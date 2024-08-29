require_relative '../../lib/omni_auth/strategies/sdm'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sdm, ENV['SDM_UID'], ENV['SDM_SECRET'], { scope: 'read' }
end
