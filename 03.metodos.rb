puts Thread.main
puts "-"

t1 = Thread.new do
  sleep(10_000)
end
Thread.list.each {|thr| p thr }
puts "Current thread = " + Thread.current.to_s
puts "--"

t2 = Thread.new do
  sleep(10_000)
end
Thread.list.each {|thr| p thr }
puts Thread.current
puts "---"

Thread.kill(t1)
Thread.pass                          # pass execution to t2 now  
t3 = Thread.new do
  sleep 1000
  Thread.exit                        # exit the thread  
end
Thread.kill(t2)

sleep 1

Thread.list.each {|thr| p thr }

# now exit the main thread (killing any others)  
Thread.exit
