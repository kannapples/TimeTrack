class Tracker < ApplicationRecord
	 # after_initialize :get_month

	# extrapolate the month based on the current date
    # def get_month
    #   	self.month ||= Time.now.month
    # end

    def update_month
    	self.month ||= self.date.month
  	end
end
