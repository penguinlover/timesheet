class TimeSheet.Views.StdListBody extends Backbone.View
  className: 'list_body'

  initialize: (options) ->
    @data = options.data

  render: =>
    $(@el).html JST['templates/std_list_body']({data: @data})
    return @

