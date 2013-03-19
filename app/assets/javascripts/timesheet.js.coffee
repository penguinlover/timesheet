window.TimeSheet =
  Models:       {}
  Collections:  {}
  Views:        {}
  Routers:      {}
  initialize: () ->
    new TimeSheet.Routers.AppRouter()
    Backbone.history.start
      root: '/dashboard'