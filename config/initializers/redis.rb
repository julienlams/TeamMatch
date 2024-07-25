require 'redis'

$redis = Redis.new(
  url: 'rediss://ec2-63-34-5-2.eu-west-1.compute.amazonaws.com:29599',
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
)
