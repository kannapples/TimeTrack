class Tracker < ApplicationRecord

	belongs_to :scrum_task, optional: true;
	accepts_nested_attributes_for :scrum_task #this allows the 'add tracker' button in the task section to complete a task

	 # after_initialize :get_month

	# extrapolate the month based on the current date
    # def get_month
    #   	self.month ||= Time.now.month
    # end

    def update_month
    	self.month ||= self.date.month
  	end
end
