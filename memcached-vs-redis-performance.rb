require 'dalli'
require 'redis'

$try_count = 1000
def try_read_and_write(message)
  count = 0
  start_time = Time.now
  $try_count.times do
    yield count
    count = count + 1
  end
  end_time = Time.now
  puts message + ":" + (end_time - start_time).to_s
end

dalli = Dalli::Client.new('localhost')

try_read_and_write('memcached') do |count|
  dalli.set(count, count)
  dalli.get(count)
  dalli.delete(count)
end

redis = Redis.new
try_read_and_write('redis not marshaled') do |count|
  redis.set(count, count)
  redis.get(count)
  redis.del(count)
end

redis = Redis.new
try_read_and_write('redis marshaled') do |count|
  redis.set(count, Marshal.dump(count))
  Marshal.load(redis.get(count))
  redis.del(count)
end
