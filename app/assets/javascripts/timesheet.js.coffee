window.TimeSheet =
  Models:       {}
  Collections:  {}
  Views:        {}
  Routers:      {}
  RegionManagers: {}

  initialize: () ->
    new TimeSheet.Routers.AppRouter()
    Backbone.history.start
      root: '/dashboard'

