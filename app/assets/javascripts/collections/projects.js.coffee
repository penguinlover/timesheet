class TimeSheet.Collections.Projects extends Backbone.Collection
  model : TimeSheet.Models.Project
  url   : 'api/projects'
  comparator: (model) ->
    model.get 'created_date'

  fetchWithSpinner: ->
    @trigger 'sync:fetch'
    callback = =>
      @fetch
        success: =>
          @trigger 'sync:success'
        error: =>
          alert ": ( Something went wrong, try again later."
    setTimeout callback, 1000
