#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require mousetrap/mousetrap
#= require_tree .

class Entries
  constructor: ->
    @_cursor = @_oldCursor = 0
    @query = $(".article")
    @_update()

  next: ->
    if @_cursor + 1 < @_length()
      @_oldCursor = @_cursor
      @_cursor += 1
      @_update()

  previous: ->
    if @_cursor > 0
      @_oldCursor = @_cursor
      @_cursor -= 1
      @_update()

  _update: ->
    oldArticle = @_entryAt(@_oldCursor)
    oldArticle.removeClass("focused")

    article = @_entryAt(@_cursor)
    article.addClass("focused")

    if @_cursor == 0
      $(document).scrollTop(0)
    else
      top = article.offset().top - 10
      $(document).scrollTop(top)

  _length: ->
    @query.length

  _entryAt: (index) ->
    @query.eq(index)

Actions =
  selectNextEntry: -> window.entries.next()
  selectPreviousEntry: -> window.entries.previous()

Mousetrap.bind "j", (e) -> Actions.selectNextEntry()
Mousetrap.bind "k", (e) -> Actions.selectPreviousEntry()

$ ->
  window.entries = new Entries
