class Waiting < ApplicationRecord
	def increment
		self.number_waiting += 1
		self.save!
	end
	def decrement
		self.number_waiting -= 1
		save!
	end
	def reset
		self.number_waiting = 0
		save!
	end
	def self.shift_waitings
		#shifts time for all waiting models when a train has departed 
		@@array_waiters = []
		self.all[0..8].each do |n|
			@@array_waiters << n
		end
		8.times do |n|
			@@array_waiters[n].number_waiting = @@array_waiters[n+1].number_waiting
			@@array_waiters[n].save!
			@@array_waiters[n+1].save!
		end
	end
end
