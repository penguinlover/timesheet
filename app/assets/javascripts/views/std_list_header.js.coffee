class TimeSheet.Views.StdListHeader extends Backbone.View
  className: 'list_header'

  initialize: (options) ->
    @data = options.data

  events:
    'click .sort_btn': 'showSortSelection'

  showSortSelection: ->
    @$('.sort_selection').slideToggle('fast')

  render: =>
    $(@el).html JST['templates/std_list_header']({ data: @data })
    return @