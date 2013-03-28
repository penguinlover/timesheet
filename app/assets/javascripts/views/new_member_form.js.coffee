class TimeSheet.Views.NewProjectMemberForm extends Support.CompositeView
  className: 'new_project_member_form'
  render: =>
    $(@el).html JST['templates/new_project_member_form']()
    return @
