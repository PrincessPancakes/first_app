class Base
  setup: (url) ->

  beforeGender: ->
  afterGender: (url) ->


  beforeCategory: ->
  afterCategory: (url) ->

  returnToUrl: (url) ->
    casper.then ->
      casper.open url