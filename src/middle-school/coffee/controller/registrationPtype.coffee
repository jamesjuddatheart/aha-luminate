angular.module 'ahaLuminateControllers'
  .controller 'RegistrationPtypeCtrl', [
    '$rootScope'
    '$scope'
    '$filter'
    '$timeout'
    'TeamraiserCompanyService'
    ($rootScope, $scope, $filter, $timeout, TeamraiserCompanyService) ->
      regCompanyId = luminateExtend.global.regCompanyId
      $rootScope.companyName = ''
      TeamraiserCompanyService.getCompanies 'company_id=' + regCompanyId,
        error: ->
          # TODO
        success: (response) ->
          companies = response.getCompaniesResponse.company
          if not companies
            # TODO
          else
            companies = [companies] if not angular.isArray companies
            companyInfo = companies[0]
            $rootScope.companyName = companyInfo.companyName
      
      if not $scope.participationOptions
        $scope.participationOptions = {}
      
      $participationType = angular.element('.js--registration-ptype-part-types input[name="fr_part_radio"]').eq 0
      $scope.participationOptions.fr_part_radio = $participationType.val()
      
      $scope.donationLevels = 
        levels: []
      $donationLevels = angular.element '.js--registration-ptype-donation-levels .donation-level-row-container'
      angular.forEach $donationLevels, ($donationLevel) ->
        $donationLevel = angular.element $donationLevel
        levelAmount = $donationLevel.find('input[type="radio"][name^="donation_level_form_"]').val()
        levelAmountFormatted = null
        if levelAmount isnt '-1' and levelAmount isnt '$0.00'
          levelAmountFormatted = $filter('currency')(Number(levelAmount.replace('$', '').replace(/,/g, '')), '$').replace '.00', ''
        $scope.donationLevels.levels.push
          amount: levelAmount
          amountFormatted: levelAmountFormatted
          isOtherAmount: levelAmount is '-1'
          isNoDonation: levelAmount is '$0.00'
          askMessage: $donationLevel.find('.donation-level-description-text').text()
      
      $scope.toggleDonationLevel = (levelAmount) ->
        $scope.participationOptions.ng_donation_level = levelAmount
        angular.forEach $scope.donationLevels.levels, (donationLevel, donationLevelIndex) ->
          if donationLevel.amount is levelAmount
            $scope.donationLevels.activeLevel = donationLevel
        if levelAmount isnt '-1'
          $scope.participationOptions.ng_donation_level_other_amount = ''
      
      $scope.previousStep = ->
        $scope.ng_go_back = true
        $timeout ->
          $scope.submitPtype()
        , 500
        false
      
      $scope.submitPtype = ->
        if not $scope.participationOptionsForm.$valid
          window.scrollTo 0, 0
        else
          angular.element('.js--default-ptype-form').submit()
          false
  ]