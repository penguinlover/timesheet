class TimeSheet.Routers.AppRouter extends Backbone.Router
  initialize: (options, data) ->
    @options  = options
    @data     = data

  routes:
    ''          : 'renderDefault'
    'projects'  : 'projects'
    'timecards' : 'timecards'

  renderDefault: ->
    nav = new TimeSheet.Views.MainNav()
    nav.render()

  projects: ->
    alert 'rendering project list view'

  timecards: ->
    alert 'rendering timecards view'


