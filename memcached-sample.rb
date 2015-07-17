require 'dalli'

dalli = Dalli::Client.new('localhost')

dalli.set(:string, "hoge")
p dalli.get(:string)

dalli.set(:time, Time.now)
p dalli.get(:time)

dalli.set(:hash, {:a => "a", :b => "b"})
p dalli.get(:hash)

dalli.set(:array, ["1", "2", "3"])
p dalli.get(:array)

dalli.set(:string, "hoge", 5)
p dalli.get(:string)
