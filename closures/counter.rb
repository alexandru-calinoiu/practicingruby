def new_counter
	x = 0
	lambda { x += 1 }
end

counter_a = new_counter
counter_a.call
counter_a.call

p counter_a.call

counter_b = new_counter
p counter_b.call

p counter_a.call