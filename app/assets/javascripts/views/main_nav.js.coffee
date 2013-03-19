class TimeSheet.Views.MainNav extends Backbone.View
  el: $('#main_nav')
  render: =>
    $(@el).html JST['templates/main_nav']()