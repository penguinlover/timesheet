class TimeSheet.Views.ProjectList extends Support.CompositeView
  className: 'std_list'

  initialize: ->
    @bindTo @collection, 'sync:success', @render

  events:
    'click #new_project_link' : 'renderForm'

  render: =>
    @renderListHeaderTpl()
    @renderListBodyTpl()
    @renderListFooterTpl()
    return @

  renderListHeaderTpl: ->
    data =
      title: 'All Projects'
      sortables: ['Created At', 'Most Team Members']
    @appendChild(new TimeSheet.Views.StdListHeader({data: data}))

  renderListBodyTpl: ->
    data = [
      { status: 'active', title: 'Mars Rover', players: [{ url: '/assets/face1.png' }, { url: '/assets/face2.png'}] }
      { status: 'finished', title: 'Mercury Rover', players: [{ url: '/assets/face2.png' }] }
      { status: 'suspended', title: 'Jupiter Rover', players: [{ url: '/assets/face3.png' }, { url: '/assets/face2.png' }, { url: '/assets/face1.png' }] }
    ]
    @appendChild(new TimeSheet.Views.StdListBody({data: data}))

  renderListFooterTpl: ->
    @appendChild(new TimeSheet.Views.StdListFooter())

  renderForm: ->
    @region.trigger 'form:new_project'

  setRegion: (region) ->
    @region = region

