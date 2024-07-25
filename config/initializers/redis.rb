require 'redis'

redis_url = ENV["REDIS_URL"] || "rediss://:pafd83a37af5b6215b24e2b215e2100a8fb87f2d6f24cf2c17fd12e222291780d@ec2-63-34-5-2.eu-west-1.compute.amazonaws.com:29599"

$redis = Redis.new(
  url: redis_url,
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_PEER }
)
