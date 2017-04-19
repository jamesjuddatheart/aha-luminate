angular.module 'ahaLuminateApp'
  .factory 'ParticipantBadgesService', [
    '$http'
    '$sce'
    ($http, $sce) ->      
      getAuth: ->
        console.log 'auth'
        url = 'https://jumphoopsstaging.boundlessnetwork.com/api/login/'
        urlSCE = $sce.trustAsResourceUrl url
        urlSCEparse = $sce.parseAsResourceUrl urlSCE

        $http
          method: 'JSONP'
          url: $sce.trustAsResourceUrl url
          auth_key: 'lxDH5IaQiUBfpqfYAN7jOn7rD'
          public_key: '44dd74bf0136e3c451af98af63d8ef5f'
         jsonpCallbackParam: 'callback'
        .then (response) ->
          console.log response
        .catch (response) ->
          console.log response

      getBadges: (requestData) ->
        url = 'https://jumphoopsstaging.boundlessnetwork.com/api/coordinator/instant/student/'+requestData
        urlSCE = $sce.trustAsResourceUrl url
        $http
          method: 'POST',
          url: urlSCE



  ]