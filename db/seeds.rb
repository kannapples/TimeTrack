# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#TaskRecurrence.create([{ name: 'day'},{ name: 'week'},{ name: 'month'}])

ProjectUmbrella.create([{name: 'Exercise'}, {name: 'Coding'}, {name: 'Music'}])

exercise_proj_umbr_id = ProjectUmbrella.find_by(name: 'Exercise').id
coding_proj_umbr_id = ProjectUmbrella.find_by(name: 'Coding').id
music_proj_umbr_id = ProjectUmbrella.find_by(name: 'Music').id

RepeatRecurrence.create(
	[
		{name: 'Daily'},
		{name: 'Weekly'},
		{name: 'Monthly'},
		{name: 'None'}
	])

Project.create(
	[
		{name: 'Work Out Daily', start_date: '1/1/2020', project_umbrella_id: exercise_proj_umbr_id},
		{name: 'TimeTrack', start_date: '1/1/2019', completion_goal_date: '12/31/2020', project_umbrella_id: coding_proj_umbr_id},
		{name: 'Coursera Class', start_date: '1/1/2020', completion_goal_date: '5/1/2020', project_umbrella_id: coding_proj_umbr_id},
		{name: 'Old Oaks Website', start_date: '3/1/2020', completion_goal_date: '4/20/20', project_umbrella_id: coding_proj_umbr_id},
		{name: 'Old Oaks', start_date: '9/1/2019', completion_goal_date: '', project_umbrella_id: music_proj_umbr_id},
		{name: 'Bad Mustard', start_date: '1/1/2018', completion_goal_date: '', project_umbrella_id: music_proj_umbr_id},
		{name: 'Jazz Standards', start_date: '', completion_goal_date: '', project_umbrella_id: music_proj_umbr_id}
	])

exercise_proj_id = Project.find_by(name: 'Work Out Daily').id
coding_timetrack_proj_id = Project.find_by(name: 'TimeTrack').id
coding_coursera_proj_id = Project.find_by(name: 'Coursera Class').id
coding_OOWeb_proj_id = Project.find_by(name: 'Old Oaks Website').id
music_oo_proj_id = Project.find_by(name: 'Old Oaks').id
music_bm_proj_id = Project.find_by(name: 'Bad Mustard').id
music_jazz_proj_id = Project.find_by(name: 'Jazz Standards').id

WeeklyGoal.create([
		{name: 'Work Out Daily', project_id: exercise_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: exercise_proj_umbr_id},
		{name: 'Prettify TimeTrack', project_id: coding_timetrack_proj_id, completed: false, repeat_recurrence_id: 4, active: true, project_umbrella_id: coding_proj_umbr_id},
		{name: 'Deploy TimeTrack on Heroku', project_id: coding_timetrack_proj_id, completed: true, repeat_recurrence_id: 4, active: true, project_umbrella_id: coding_proj_umbr_id},
		{name: 'Convert Project Page to SPA', project_id: coding_timetrack_proj_id, completed: false, repeat_recurrence_id: 4, active: true, project_umbrella_id: coding_proj_umbr_id},
		{name: 'Change Repeat Recurrence Options to Days of Week', project_id: coding_timetrack_proj_id, completed: false, repeat_recurrence_id: 4, active: true, project_umbrella_id: coding_proj_umbr_id},
		{name: 'Work on Coursera Class', project_id: coding_coursera_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: coding_proj_umbr_id},
		{name: 'Website Updates', project_id: coding_OOWeb_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: coding_proj_umbr_id},
		{name: 'Memorize Tunes', project_id: music_oo_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: music_proj_umbr_id},
		{name: 'Send out Booking Emails', project_id: music_oo_proj_id, completed: false, repeat_recurrence_id: 3, active: true, project_umbrella_id: music_proj_umbr_id},
		{name: 'Memorize Tunes', project_id: music_bm_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: music_proj_umbr_id},
		{name: 'Compose Music', project_id: music_bm_proj_id, completed: false, repeat_recurrence_id: 3, active: true, project_umbrella_id: music_proj_umbr_id},
		{name: 'Send out Booking Emails', project_id: music_bm_proj_id, completed: false, repeat_recurrence_id: 3, active: true, project_umbrella_id: music_proj_umbr_id},
		{name: 'Scales/Theory', project_id: music_jazz_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: music_proj_umbr_id},
		{name: 'Memorize Tunes', project_id: music_jazz_proj_id, completed: false, repeat_recurrence_id: 2, active: true, project_umbrella_id: music_proj_umbr_id}
	])

exercise_wg_id = WeeklyGoal.find_by(name: 'Work Out Daily').id
coding_timetrack_prettify_wg_id = WeeklyGoal.find_by(name: 'Prettify TimeTrack').id
coding_timetrack_heroku_wg_id = WeeklyGoal.find_by(name: 'Deploy TimeTrack on Heroku').id
coding_timetrack_spa_wg_id = WeeklyGoal.find_by(name: 'Convert Project Page to SPA').id
coding_timetrack_rr_wg_id = WeeklyGoal.find_by(name: 'Change Repeat Recurrence Options to Days of Week').id
coding_coursera_wg_id = WeeklyGoal.find_by(name: 'Work on Coursera Class').id
coding_oo_wg_id = WeeklyGoal.find_by(name: 'Website Updates').id
music_oo_memorize_wg_id = WeeklyGoal.find_by(name: 'Memorize Tunes', project_id: music_oo_proj_id).id
music_oo_booking_wg_id = WeeklyGoal.find_by(name: 'Send out Booking Emails', project_id: music_oo_proj_id).id
music_bm_memorize_wg_id = WeeklyGoal.find_by(name: 'Memorize Tunes', project_id: music_bm_proj_id).id
music_bm_compose_wg_id = WeeklyGoal.find_by(name: 'Compose Music').id
music_bm_booking_wg_id = WeeklyGoal.find_by(name: 'Send out Booking Emails', project_id: music_bm_proj_id).id
music_jazz_scales_wg_id = WeeklyGoal.find_by(name: 'Scales/Theory').id
music_jazz_memorize_wg_id = WeeklyGoal.find_by(name: 'Memorize Tunes', project_id: music_jazz_proj_id).id

DailyTask.create([
	{name: 'Work Out Today!', completed: true, repeat_recurrence_id: 1, active: true, project_id: exercise_proj_id, weekly_goal_id: exercise_wg_id, project_umbrella_id: exercise_proj_umbr_id, is_today_task: true},
	{name: 'CSS Overhaul of Main Page', completed: false, repeat_recurrence_id: 4, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_prettify_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: true},
	{name: 'CSS Overhaul of Project Page', completed: false, repeat_recurrence_id: 4, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_prettify_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: false},
	{name: 'Deploy and Troubleshoot issues', completed: true, repeat_recurrence_id: 4, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_heroku_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: false},
	{name: 'Add Javascript fx', completed: false, repeat_recurrence_id: 4, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_spa_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: true},
	{name: 'Wireframe plan for functionality', completed: false, repeat_recurrence_id: 4, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_rr_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: false},
	{name: 'Build out DoW model', completed: false, repeat_recurrence_id: 4, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_rr_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: false},
	{name: 'Work on Coursera Class', completed: true, repeat_recurrence_id: 1, active: true, project_id: coding_coursera_proj_id, weekly_goal_id: coding_coursera_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: true},
	{name: 'Apply changes from QA to Website', completed: false, repeat_recurrence_id: 4, active: true, project_id: coding_OOWeb_proj_id, weekly_goal_id: coding_oo_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: false},
	{name: 'Update Website with Gigs/News', completed: false, repeat_recurrence_id: 3, active: true, project_id: coding_OOWeb_proj_id, weekly_goal_id: coding_oo_wg_id, project_umbrella_id: coding_proj_umbr_id, is_today_task: false},
	{name: 'Memorize 2 Tunes', completed: false, repeat_recurrence_id: 2, active: true, project_id: music_oo_proj_id, weekly_goal_id: music_oo_memorize_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: true},
	{name: 'Send out Booking Emails', completed: false, repeat_recurrence_id: 3, active: false, project_id: music_oo_proj_id, weekly_goal_id: music_oo_booking_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: false},
	{name: 'Memorize 2 Tunes', completed: false, repeat_recurrence_id: 2, active: true, project_id: music_bm_proj_id, weekly_goal_id: music_bm_memorize_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: false},
	{name: 'Practice Solos', completed: false, repeat_recurrence_id: 2, active: true, project_id: music_bm_proj_id, weekly_goal_id: music_bm_memorize_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: true},
	{name: 'Keep Writing Out New Tune', completed: false, repeat_recurrence_id: 3, active: true, project_id: music_bm_proj_id, weekly_goal_id: music_bm_compose_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: false},
	{name: 'Send out Booking Emails', completed: false, repeat_recurrence_id: 3, active: true, project_id: music_bm_proj_id, weekly_goal_id: music_bm_booking_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: false},
	{name: 'Work on Scales/Arpeggios', completed: false, repeat_recurrence_id: 1, active: true, project_id: music_jazz_proj_id, weekly_goal_id: music_jazz_scales_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: true},
	{name: 'Transcribe Solos', completed: false, repeat_recurrence_id: 3, active: false, project_id: music_jazz_proj_id, weekly_goal_id: music_jazz_scales_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: false},
	{name: 'Memorize 2 Tunes', completed: false, repeat_recurrence_id: 2, active: false, project_id: music_jazz_proj_id, weekly_goal_id: music_jazz_memorize_wg_id, project_umbrella_id: music_proj_umbr_id, is_today_task: false}
])

exercise_dt_id = DailyTask.find_by(name: 'Work Out Today!').id
coding_timetrack_css_main_dt_id = DailyTask.find_by(name: 'CSS Overhaul of Main Page').id
coding_timetrack_css_project_dt_id = DailyTask.find_by(name: 'CSS Overhaul of Project Page').id
coding_timetrack_heroku_deploy_dt_id = DailyTask.find_by(name: 'Deploy and Troubleshoot issues').id
coding_timetrack_spa_js_dt_id = DailyTask.find_by(name: 'Add Javascript fx').id
coding_timetrack_rr_wireframe_dt_id = DailyTask.find_by(name: 'Wireframe plan for functionality').id
coding_timetrack_rr_dow_dt_id = DailyTask.find_by(name: 'Build out DoW model').id
coding_coursera_dt_id = DailyTask.find_by(name: 'Work on Coursera Class').id
coding_oo_qa_dt_id = DailyTask.find_by(name: 'Apply changes from QA to Website').id
coding_oo_gigs_dt_id = DailyTask.find_by(name: 'Update Website with Gigs/News').id
music_oo_memorize_dt_id = DailyTask.find_by(name: 'Memorize 2 Tunes', weekly_goal_id: music_oo_memorize_wg_id).id
music_oo_booking_dt_id = DailyTask.find_by(name: 'Send out Booking Emails', weekly_goal_id: music_oo_booking_wg_id).id
music_bm_memorize_2_dt_id = DailyTask.find_by(name: 'Memorize 2 Tunes', weekly_goal_id: music_bm_memorize_wg_id).id
music_bm_memorize_solo_dt_id = DailyTask.find_by(name: 'Practice Solos').id
music_bm_compose_dt_id = DailyTask.find_by(name: 'Keep Writing Out New Tune').id
music_bm_booking_dt_id = DailyTask.find_by(name: 'Send out Booking Emails', weekly_goal_id: music_bm_booking_wg_id).id
music_jazz_scales_dt_id = DailyTask.find_by(name: 'Work on Scales/Arpeggios').id
music_jazz_scales_trans_dt_id = DailyTask.find_by(name: 'Transcribe Solos').id
music_jazz_memorize_dt_id = DailyTask.find_by(name: 'Memorize 2 Tunes', weekly_goal_id: music_jazz_memorize_wg_id).id

#TRACKERS

#FILL OUT TODAYS TRACKERS
tracker_date = Date.today.strftime("%Y-%m-%d")
tracker_day = Date.today.strftime("%d")
tracker_month = Date.today.strftime("%m")
tracker_year = Date.today.strftime("%Y")
number_of_dts = DailyTask.all.count
tracks_in_day = rand(5)

Tracker.create([	
	{date: tracker_date, description: 'Yoga', hours: 1, start_time: '07:00:00', end_time: '08:00:00', payment: '', month: tracker_month, active: true, project_id: exercise_proj_id, weekly_goal_id: exercise_wg_id, daily_task_id: exercise_dt_id, project_umbrella_id: exercise_proj_umbr_id},
	{date: tracker_date, description: 'Coursera', hours: 2, start_time: '08:00:00', end_time: '10:00:00', payment: '', month: tracker_month, active: true, project_id: coding_coursera_proj_id, weekly_goal_id: coding_coursera_wg_id, daily_task_id: coding_coursera_dt_id, project_umbrella_id: coding_proj_umbr_id},
	{date: tracker_date, description: 'fix dropdown css', hours: 2.5, start_time: '10:00:00', end_time: '12:30:00', payment: '', month: tracker_month, active: true, project_id: coding_timetrack_proj_id, weekly_goal_id: coding_timetrack_prettify_wg_id, daily_task_id: coding_timetrack_css_main_dt_id, project_umbrella_id: coding_proj_umbr_id}
])

#FILL OUT THIS MONTHS TRACKERS
for i in 1..tracker_day.to_i #populate trackers up until current date
	time_counter = 7 #initialize time counter
	for j in 0..tracks_in_day #populate a random number of trackers per day between 0 and 5
		rand_dt = DailyTask.order('RANDOM()').first
		rand_dt_id = rand_dt.id
		rand_wg_id = rand_dt.weekly_goal_id
		rand_p_id = rand_dt.project_id
		rand_pu_id = rand_dt.project_umbrella_id

		rand_hour = rand(1..3)
		if time_counter >= 10
			tracker_start_time = time_counter.to_s+':00:00'
		else 
			tracker_start_time = '0'+time_counter.to_s+':00:00'
		end

		track_end_num = time_counter + rand_hour
		if (track_end_num) >= 10
			tracker_end_time = track_end_num.to_s+':00:00'
		else 
			tracker_end_time = '0'+track_end_num.to_s+':00:00'
		end

		Tracker.create([	
			{date: tracker_year+'-'+tracker_month+'-'+i.to_s, description: rand_dt.name, hours: rand_hour, start_time: tracker_start_time, end_time: tracker_end_time, payment: '', month: tracker_month, active: true, project_id: rand_p_id, weekly_goal_id: rand_wg_id, daily_task_id: rand_dt_id, project_umbrella_id: rand_pu_id}
		])

		time_counter += rand_hour #increment time counter
	end
end
