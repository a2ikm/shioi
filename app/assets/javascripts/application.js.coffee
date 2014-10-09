#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require mousetrap/mousetrap
#= require_tree .

class Entries
  constructor: ->
    @_cursor = @_oldCursor = null
    @_query = $(".article")

    if @_length() > 0
      @_offset = @_entryAt(0).offset().top

  first: ->
    if @_cursor == null
      @_cursor = 0
      @_update()
      @_oldCursor = 0

    else
      @_oldCursor = @_cursor
      @_cursor = 0
      @_update()

  next: ->
    if @_cursor == null
      @_cursor = 0
      @_update()
      @_oldCursor = 0

    else if @_cursor + 1 < @_length()
      @_oldCursor = @_cursor
      @_cursor += 1
      @_update()

  previous: ->
    if @_cursor == null
      @_cursor = 0
      @_update()
      @_oldCursor = 0

    else if @_cursor > 0
      @_oldCursor = @_cursor
      @_cursor -= 1
      @_update()

  _update: ->
    if @_oldCursor != null
      $oldArticle = @_entryAt(@_oldCursor)
      $oldArticle.removeClass("focused")
      $oldArticle.addClass("read")

    $article = @_entryAt(@_cursor)
    $article.addClass("focused")

    $document = $(document)

    if @_cursor == 0
      $document.scrollTop(0)
    else
      top = $article.offset().top - @_offset
      $document.scrollTop(top)

  _length: ->
    @_query.length

  _entryAt: (index) ->
    @_query.eq(index)

Mousetrap.bind "j", (e) -> window.entries.next()
Mousetrap.bind "k", (e) -> window.entries.previous()
Mousetrap.bind "g g", (e) -> window.entries.first()

$ ->
  window.entries = new Entries
