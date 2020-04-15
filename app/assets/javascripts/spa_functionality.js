
// //SPA (Single page application) FUNCTIONALITY
// (function (global) { //IIFE
// 'use strict'; //don't allow accidental global variables

// angular.module('TimeTrack', [])
//   // .controller('TaskGoalHeader', TaskGoalHeader)
//   .controller('TaskGoalContent', TaskGoalContent);



//   TaskGoalContent.$inject = ['$scope'] //Make sure the scope service will be recognized in minified script
//   function TaskGoalContent($scope) {
  
//      $scope.loadTrackerTodayTasks = function(){
//        $scope.taskHeading = "Today Tasks";

//        //change button toggle class to highlight clicked button
//        $scope.activeTaskToggle = "active-task-toggle-btn";
//        $scope.activeGoalToggle = "";

//       $scope.inactiveTaskContentToggle = "";
//       $scope.inactiveGoalContentToggle = "inactive-task-content-toggle";
       
//      }

//      $scope.loadTrackerWeeklyGoals = function() {
//       $scope.taskHeading = "Weekly Goals";

//       //change button toggle class to highlight clicked button
//       $scope.activeTaskToggle = "";
//       $scope.activeGoalToggle = "active-task-toggle-btn";
      
//       $scope.inactiveTaskContentToggle = "inactive-task-content-toggle";
//       $scope.inactiveGoalContentToggle = "";
//      }

//      //initialization function to load Today Task info 
//      var init = function () {
//         $scope.loadTrackerTodayTasks();
//      }

//      init(); //call initialization function
     
//   };

  // TaskGoalContent.$inject = ['$scope']
  // function TaskGoalContent($scope) {

  //   $scope.loadTrackerTodayTasks = function () {
  //     $
  //   };

  //   $scope.loadTrackerWeeklyGoals = function () {
      
  //   }
    
  //   //initialization function to load Today Task info 
  //    var init = function () {
  //       $scope.loadTrackerTodayTasks();
  //    }

  //    init(); //call initialization function
       
  // };

// var spa = {};

//TRACKERS
//get html script locations for SPA
// var trackerTodayTaskHtml = "app/views/trackers/snippets/todays_tasks_snippet.html.erb";
// var trackerWeeklyGoalHtml = "app/views/trackers/snippets/weekly_goals_snippet.html.erb";

// //Convenience function for inserting innerHTML for 'select'
// var insertHtml = function (selector, html) {
// 	var targetElem = document.querySelector(selector);
// 	targetElem.innerHTML = html;
// };

// //Show loading icon inside element identified by selector
// var showLoading = function (selector) {
// 	var html = "<div class='text-center'>";
// 	//user ajaxload.info to get loading gif
// 	html += "<img src='app/assets/images/ajax-loader.gif'></div>";
// 	insertHtml(selector, html);
// };


// // //On page load (before images or CSS)
// document.addEventListener("DOMContentLoaded", function(event){
//  // var script = document.currentScript;
//   // var fullUrl = script.src;
//   // console.log(script);
// 	//On first load, show today tasks view
// 	$scope.loadTrackerTodayTasks();

// });

// // //Load the weekly goals view
//  loadTrackerWeeklyGoals = function () {
//    $scope.taskHeading = "Weekly Goals";

// //   // showLoading("#task_goal_content");
// //   //Update Task/Goal toggle button
// //   // $('#weekly-goals-btn').addClass('active-task-toggle-btn');
// //   // $('#today-tasks-btn').removeClass('active-task-toggle-btn');
// //   // insertHtml('#task_goal_content', trackerWeeklyGoalHtml);
 
// //   // document.querySelector("#task_goal_content").innerHTML = trackerWeeklyGoalHtml;
//  };

// //Load the daily tasks view
// loadTrackerTodayTasks = function () {
//   $scope.taskHeading = "Daily Tasks";
//   // showLoading("#task_goal_content");
//   //Update Task/Goal toggle button
//   // $('#today-tasks-btn').addClass('active-task-toggle-btn');
//   // $('#weekly-goals-btn').removeClass('active-task-toggle-btn');
//   // document.querySelector("#task_goal_content").innerHTML = trackerTodayTaskHtml.innerHTML;
// };


// global.$spa = spa;

// })();