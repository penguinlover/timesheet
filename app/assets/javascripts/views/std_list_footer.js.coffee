class TimeSheet.Views.StdListFooter extends Backbone.View
  className: 'list_footer'
  render: =>
    $(@el).html JST['templates/std_list_footer']()
    return @