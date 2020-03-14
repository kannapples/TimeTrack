function toggleScrumView(option) {
	if (option == 'week') {
		$('#daily_scrum_tasks').hide();
		$('#weekly_scrum_tasks').show();
		$('#scrum-weekly-tasks-btn').addClass('active-scrum-toggle-btn');
		$('#scrum-today-tasks-btn').removeClass('active-scrum-toggle-btn');

	} else if (option == 'today') {
		$('#daily_scrum_tasks').show();
		$('#weekly_scrum_tasks').hide();
		$('#scrum-today-tasks-btn').addClass('active-scrum-toggle-btn');
		$('#scrum-weekly-tasks-btn').removeClass('active-scrum-toggle-btn');
	}
};