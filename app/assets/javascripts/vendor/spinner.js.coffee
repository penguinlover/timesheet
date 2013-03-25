class Spinner
  constructor: (options) ->
    if !options && options.el
      throw new Error("Must supply an 'el'")
    @el = $(options.el)
    @old_color = @el.css('background-color');

    defaults =
      width: 100
      height: 100
      pointDistance: .04
      strokeColor: '#CCC'
      fps: 15
      setup: ->
          @_.lineWidth = 4
      step: (point, index) ->
        cx = @padding + 50
        cy = @padding + 50
        _ = @_
        angle = (Math.PI/180) * (point.progress * 360)
        innerRadius = 25
        _.beginPath()
        _.moveTo(point.x, point.y)
        _.lineTo (Math.cos(angle) * innerRadius) + cx, (Math.sin(angle) * innerRadius) + cy
        _.closePath()
        _.stroke()
      path: [ ['arc', 50, 50, 40, 0, 360] ]

    @default_options = _.extend defaults, options.spec

    # eagerly load the spinner and make it invisable
    @_spinner = new Sonic(@default_options)
    $(@_spinner.canvas).hide()
    @el.append @_spinner.canvas
    @setDefaultStyle()

  setDefaultStyle: ->
    canvas = $(@_spinner.canvas)
    y_offset = @default_options.height / -2
    x_offset = @default_options.width  / -2
    canvas.css
      'position'    : 'absolute'
      'z-index'     : '9999'
      'left'        : '50%'
      'top'         : '50%'
      'margin-top'  : y_offset
      'margin-left' : x_offset
      'background-color' : 'rgba(0,0,0,0.45)'

  start: ->
    @_spinner.play()
    $(@_spinner.canvas).show()
    @el.transition({ 'background-color': 'rgba(0,0,0,0.33)' })

  stop: ->
    $(@_spinner.canvas).hide()
    @_spinner.stop()
    @el.transition({ 'background-color': @old_color })

window.Spinner = Spinner
