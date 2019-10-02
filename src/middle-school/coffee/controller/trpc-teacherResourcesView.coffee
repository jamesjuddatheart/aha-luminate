angular.module 'trPcControllers'
  .controller 'NgPcTeacherResourcesViewCtrl', [
    '$scope'
    'PageBuilderService'
    ($scope, PageBuilderService) ->
      $scope.trustHtml = (html) ->
        return $sce.trustAsHtml(html)
      PageBuilderService.getPageContent 'reus_ym_ahc_teacher_resources', 'tab=middleschool'
        .then (response) ->
          pageContent = response.data
          if pageContent
            $scope.pageContent = pageContent
]
