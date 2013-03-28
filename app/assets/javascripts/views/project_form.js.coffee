class TimeSheet.Views.ProjectForm extends Support.CompositeView
  className: 'project_form'

  render: =>
    @appendChild(new TimeSheet.Views.NewProjectForm)
    @appendChild(new TimeSheet.Views.NewProjectMemberForm)
    return @

  setRegion: (region) ->
    @region = region