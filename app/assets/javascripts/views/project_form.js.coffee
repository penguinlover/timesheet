class TimeSheet.Views.ProjectForm extends Support.CompositeView
  className: 'project_form'

  render: =>
    $(@el).html JST['templates/project_form']()
    return @

  setRegion: (region) ->
    @region = region