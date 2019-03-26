angular.module 'ahaLuminateControllers'
  .controller 'SchoolSearchCtrl', [
    '$scope'
    'SchoolSearchService'
    ($scope, SchoolSearchService) ->
      # on init - last param true = get events by location on load; false = do nothing on load
      SchoolSearchService.init $scope, 'District Heart Challenge', false
]
