app.controller 'HomeCtrl', ($rootScope, $scope, $http, $log) ->
	class Subscribe
		constructor: ->
		send: ->
			return if not @name? or not @email
			
			mixpanel.identify @email
			mixpanel.people.set
				"$name": @name
				"$email": @email,
				"$last_login": new Date()

			mixpanel.track("Subscribe", 
				name: @name, 
				email: @email)

			@sent = true

	$scope.subscribe = new Subscribe()