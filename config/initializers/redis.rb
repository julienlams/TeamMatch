require 'redis'

redis_url = ENV["REDIS_URL"] || "rediss://ec2-63-34-5-2.eu-west-1.compute.amazonaws.com:29599"

$redis = Redis.new(
  url: redis_url,
  ssl_params: {
    verify_mode: OpenSSL::SSL::VERIFY_PEER,
    ca_file: Rails.root.join('config/ca_certificate.pem').to_s
  }
)
