# LiteView

TODO:
* Write README
* Add tests

## HOW TO USE

```
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
