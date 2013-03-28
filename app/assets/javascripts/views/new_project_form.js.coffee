class TimeSheet.Views.NewProjectForm extends Support.CompositeView
  className: 'new_project_form'
  render: =>
    $(@el).html JST['templates/new_project_form']()
    return @