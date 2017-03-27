angular.module 'ahaLuminateControllers'
  .controller 'CmsCtrl', [
    '$scope'
    '$timeout'
    ($scope, $timeout) ->
      initCarousel = ->
        owl = jQuery '.owl-carousel'
        owl.owlCarousel
          nav: true
          items: 3
          loop: true
          margin: 60
          navText: [
            '<i class="fa fa-chevron-left" aria-hidden="true" />',
            '<i class="fa fa-chevron-right" aria-hidden="true" />'
          ]
 
        #jQuery('.owl-nav').removeClass('disabled')

      if angular.element('ym-carousel--internal')
        console.log 'fire rotate'
        $timeout initCarousel, 1000

  ]