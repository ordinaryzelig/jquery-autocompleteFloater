'========================='
'autocompleteFloater'
''
'v0.0.1'
''
'https://github.com/ordinaryzelig/jquery-autocompleteFloater'
'This software is offered as is without warranty, yada yada.'
'========================='

$.fn.autocompleteFloater = ->
  selectTags = @

  # Create and add link to show floater.
  linkToShowFloater = autocompleteFloaterFunctions.createLinktoShowFloater()
  selectTags.after(linkToShowFloater)

  # Create and add floater.
  floater = autocompleteFloaterFunctions.createFloater()
  linkToShowFloater.after(floater)

  # For each select tag, generate jQuery autocomplete to their floaters.
  # When an option is selected, the select tag will automatically select the matching option.
  # The floater is then hidden.
  # This must be done for each select tag individually so the autocomplete source is populated
  # with that select tag's options.
  selectTags.each ->
    selectTag = $(@)
    # Get options to populate autocomplete.
    optionStrings = selectTag.children('option').map(->
      $(@).html()
    ).get()
    # Add jQuery autocomplete to text field.
    textField = selectTag.siblings('.autocompleteFloater').children('input:text')
    textField.autocomplete
      source: optionStrings
      select: (event, ui) ->
        # Find the matching option in the select tag and change it to selected.
        selected = ui.item.value
        floater = $(@).parents('.autocompleteFloater')
        selectTag = floater.siblings('select')
        # Iterate through each option.
        # When matching option found, select it in the select tag.
        selectTag.children('option').each ->
          option = $(@)
          if option.text() == selected
            selectTag.val(parseInt(option.val()))
            return false
        # Hide the floater.
        floater.hide()

autocompleteFloaterFunctions = {

  createFloater: ->
    floater = $('<div class="autocompleteFloater"></div>')
    floater.hide()
    autocompleteTextField = @createAutocompleteTextField()
    autocompleteTextField.appendTo(floater)
    floater

  createAutocompleteTextField: (selectTag) ->
    $('<input type="text" />')

  createLinktoShowFloater: ->
    linkContent = '+'
    link = $("""
      <a class="autocompleteFloaterLink" href="">
        #{linkContent}
      </a>
      """
    )
    link.click (event) ->
      event.preventDefault()
      $(@).next('.autocompleteFloater').toggle()
    link

}
