# config/initializers/sidekiq.rb

Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' } # Configure Redis connection
    config.logger = Logger.new(Rails.root.join('log', 'sidekiq.log')) # Log Sidekiq output
  end
  
Sidekiq.configure_client do |config|
config.redis = { url: 'redis://localhost:6379/0' } # Configure Redis connection for client (for enqueueing jobs)
end
