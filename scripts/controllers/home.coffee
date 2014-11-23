app.controller 'HomeCtrl', ($rootScope, $scope, $http, $log) ->
	class Subscribe
		constructor: ->
		send: ->
			return if not @name? or not @email

			mixpanel.people.set
				"$email": @email,
				"$last_login": new Date()
				name: @name, 

			@sent = true

	$scope.subscribe = new Subscribe()