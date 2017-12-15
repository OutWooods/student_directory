#Grandfather clock 

#Attempt at the grandfather problem form Chris Pine
#https://pine.fm/LearnToProgram/chap_10.html exercise 1
#With a method that returns a proc (proc call)


def grandfather_clock(some_proc)
    n = Time.now.hour % 12 == 0 ? 12 : Time.now.hour
    n.times {some_proc.call}
end

def two_procs(proc1, proc2)
	Proc.new do 
	proc1.call
	proc2.call
    end
end

chime = Proc.new {puts "DONG!"}
ring = Proc.new {puts "Ding!"}
ding_dong = two_procs(chime, ring)


grandfather_clock(ding_dong)