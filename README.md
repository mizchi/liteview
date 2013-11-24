# LiteView

LiteView is simple view library inspired by Backbone.View, Chaplin.js and skin.js(my tiny library).

written by typed-coffee-script

## Concpet

I noticed what I really need is enclosed this.$el and its controller when I use Backbone.View.
And Backbone.View has some useful helpers but they makes constructor heavy.


## requirement

* jQuery

## Build

```
$ tcoffee --js < src/liteview.coffee > dist/liteview.js
```

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
