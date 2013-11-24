class ValueObject
  css: -> @$el.css arguments...
  selectorCss: (selector, args...) -> @$(selector).css args...

  constructor: (opts) ->
    @$el = opts.$el ? $el $('<div>')

  $: (selector) -> @$el.find(selector)

  show: -> @$el.show()

  hide: -> @$el.hide()

  remove: -> @$el.remove()

  on: -> @$el.on arguments...

  off: -> @$el.off arguments...

  html: -> @$el.html arguments...

  text: -> @$el.text arguments...

  # cssProperty 'x', 'left'
  cssProperty: (key, propertyName) ->
    propertyName ?= key
    Object.defineProperty @, key,
      get: -> @css(propertyName)
      set: (v :: String) -> @css propertyName, v

class LiteView extends ValueObject
  template: ->

  constructor: (opts) ->
    ValueObject.constructor.apply this, arguments

    @_dom_cache = {}
    @$el = opts?.$el ? $('<div>')
    @render()

  render: ->
    if @template
      @$el.html @template

  attach: (selector, container = null)->
    if arguments.length is 1 and selector instanceof LiteView
      selector.$el.append @$el
    else if container instanceof Backbone.View
      container.$(selector).append @$el
    else
      $(selector).append @$el

  detach: ->
    @$el.detach()

  # domProperty '$hoge', 'span.hoge'
  domProperty: (key, selector) ->
    el = @$(selector)
    if el.length > 0
      @_dom_cache[key] = new ValueObject $el: el
    Object.defineProperty @, key,
      get: ->
        if @_dom_cache[key]?
          @_dom_cache[key]
        else
          el = @$(selector)
          if el.length > 0
            @_dom_cache[key] = new ValueObject $el: el
          else
            null

      set: (v) ->
        if v instanceof jQuery
          @_dom_cache[key] = new ValueObject $el: v
        else if v instanceof HTMLElement
          @_dom_cache[key] = new ValueObject $el: $(v)
        else
          throw 'invalid value as DOM element'

window.LiteView = LiteView
