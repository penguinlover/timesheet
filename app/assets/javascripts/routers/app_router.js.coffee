class TimeSheet.Routers.AppRouter extends Backbone.Router
  initialize: (options, data) ->
    @options  = options
    @data     = data
    @createRegionManagers()

  routes:
    ''              : 'renderDefault'
    'projects'      : 'projects'
    'projects/:id'  : 'project'
    'timecards'     : 'timecards'
    'timecards/:id' : 'timecard'

  renderDefault: ->
    @nav = new TimeSheet.Views.MainNav()
    @nav.render()

  projects: ->
    @renderDefault() if !@nav
    projects = new TimeSheet.Collections.Projects()
    project_list_view = new TimeSheet.Views.ProjectList({ collection: projects })
    @rm_main.set
      view: project_list_view
      model: projects
    #projects.fetchWithSpinner()

  project: (id)->
    alert id

  timecards: ->
    @renderDefault() if !@nav
    alert 'rendering timecards view'

  timecard: (id) ->
    @renderDefault() if !@nav
    alert id

  createRegionManagers: ->
    @rm_main = new Backbone.RegionManager
      el: $('#main_contents')
      spinner: new Spinner({ el: '#main_contents' })
    @rm_aux = new Backbone.RegionManager
      el: $('#aux_contents')
      spinner: new Spinner({ el: '#aux_contents' })
    # define communications among regions
    @rm_main.on 'form:new_project', =>
      @rm_main.el.transition
        right: 501
        duration: 1000

      new_project = new TimeSheet.Models.Project
      project_form = new TimeSheet.Views.ProjectForm({ model: new_project })
      @rm_aux.set
        model: new_project
        view: project_form


