Backbone.RegionManager = (options) ->
  @options = options || {}
  _.extend @, options
  if !@el
    throw new Error("An 'el' must be set.")
  if !@spinner
    throw new Error("Please add a spinner.")

  if @initialize
    @initialize.apply @, arguments

_.extend Backbone.RegionManager.prototype, Backbone.Events,
  show: (view) ->
    @close()
    view.render()
    @open view
    view.onShow() if view.onShow
    @currentView = view

  open: (view) ->
    @el.append view.el

  close: ->
    view = @currentView
    return if !view
    view.leave() if view.leave
    delete @currentView

  reset: ->
    @close()
    delete $(@el)

  set: (options) ->
    if options.model?
      options.model.on 'sync:fetch', =>
        @spinner.start()
      options.model.on 'sync:success', =>
        @spinner.stop()
    if options.view?
      options.view.setRegion(@)
      @show options.view