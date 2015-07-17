require 'redis'

redis = Redis.new

redis.set(:string, "hoge")
p redis.get(:string)

redis.set(:time, Time.now)
p redis.get(:time)

redis.set(:time2, Marshal.dump(Time.now))
p Marshal.load(redis.get(:time2))

redis.set(:hash, {:a => "a", :b => "b"})
p redis.get(:hash)

redis.set(:hash1, Marshal.dump({:a => "a", :b => "b"}))
p Marshal.load(redis.get(:hash1))

redis.set(:array, ["1", "2", "3"])
p redis.get(:array)

redis.set(:array, Marshal.dump(["1", "2", "3"]))
p Marshal.load(redis.get(:array))

