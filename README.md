# LiteView

LiteView is simple view library inspired by Backbone.View, Chaplin.js and skin.js(my tiny library).

written by typed-coffee-script


## requirement

* jQuery



```coffee
$ ->
  class A extends LiteView
    template: ->
      '<div class="hoge"></div>'

    constructor: ->
      LiteView.apply @, arguments
      @domProperty 'hoge', 'div.hoge'

  a = new A
  a.attach 'body'
  a.hoge.text 'fuga'
```
