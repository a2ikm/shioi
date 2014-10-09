#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require mousetrap/mousetrap
#= require_tree .

class Entries
  constructor: ->
    @_cursor = @_oldCursor = null
    @query = $(".article")

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
    @query.length

  _entryAt: (index) ->
    @query.eq(index)

Actions =
  selectNextEntry: -> window.entries.next()
  selectPreviousEntry: -> window.entries.previous()
  selectFirstEntry: -> window.entries.first()

Mousetrap.bind "j", (e) -> Actions.selectNextEntry()
Mousetrap.bind "k", (e) -> Actions.selectPreviousEntry()
Mousetrap.bind "g g", (e) -> Actions.selectFirstEntry()

$ ->
  window.entries = new Entries
