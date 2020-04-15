require 'rails_helper'

RSpec.describe "trackers/index", type: :view, js: true do


  before(:each) do
  	visit '/index'
  end

  it "dropdown menu navigates to other pages correctly" do

  	click_button(id: "tracker_index_nav_btn")
  	click_link(id: "tracker_index_nav_month_tracker_link")
  	expect(page).to have_current_path(month_index_path)

  	visit '/index'
  	click_button(id: "tracker_index_nav_btn")
  	click_link("Project List")
  	expect(page).to have_current_path(projects_path)

  	# visit '/index'
  	# click_button(id: "tracker_index_nav_btn")
  	# click_link("NT Process")
  	# TODO: find a way to verify that this links to a specific method
  end
  
  # verify that the div containing todays tasks is shown, not the weekly goal section
  it "loads on the today view" do
  	expect(page).to have_text "Today's Tasks"
  end

   # DAILY TASKS
  it "displays a message if there are no today tasks set up" do 

  end

  it "creates a new task when New Daily Task is clicked" do

  end

  # SWITCH TO WEEKLY GOALS

  it "displays a message if there are no weekly goals set up" do

  end

  it "creates a new goal when New Weekly Goal is clicked" do

  end

  # TRACKERS

  it "displays a message if there are no trackers" do
  	expect(page).to have_text "No Trackers Logged"
  end

  it "creates a new tracker when New Tracker is clicked" do
  	click_link(id: "index-new-tracker")
  	within('#tracker-modal-window') do  #check for all required fields in the popup
  		find('#tracker-modal-title', text: 'New Tracker')
  		find('#tracker_date')
  		find('#tracker_new_project_umbrella_selector')
  		find('#tracker_new_project_selector')
  		find('#tracker_new_weekly_goal_selector')
  		find('#tracker_new_daily_task_selector')
  		find('#tracker_description_input')
  		find('#tracker_hours_input')
  		find('#tracker_start_time_selector')
  		find('#tracker_end_time_selector')
  		find('#tracker_payment_input')
  		find('#tracker_submit')

  	end
  end


end


