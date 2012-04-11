'========================='
'autocompleteFloater'
''
'v0.1.1'
''
'https://github.com/ordinaryzelig/jquery-autocompleteFloater'
'This software is offered as is without warranty, yada yada.'
'========================='

$ = jQuery

$.fn.autocompleteFloater = ->
  @.each ->

    selectTag = $(@)

    # Create and add link to show floater.
    linkToShowFloater = autocompleteFloaterFunctions.createLinktoShowFloater()
    selectTag.after(linkToShowFloater)

    # Create and add floater.
    floater = autocompleteFloaterFunctions.createFloater()
    linkToShowFloater.after(floater)

    # Add autocomplete.
    autocompleteFloaterFunctions.autocomplete(selectTag)

autocompleteFloaterFunctions = {

  createFloater: ->
    floater = $('<div class="autocompleteFloater ui-state-hover"></div>')
    floater.hide()
    autocompleteTextField = @createAutocompleteTextField()
    autocompleteTextField.appendTo(floater)
    floater

  createAutocompleteTextField: (selectTag) ->
    textField = $('<input type="text" placeholder="Search" />')
    # Ignore return key presses to prevent form submission.
    textField.keydown (event) ->
      returnKeyCode = 13
      if event.keyCode == returnKeyCode
        event.preventDefault()
    # Hide floater on blur.
    textField.blur ->
      floater = $(@).parents('.autocompleteFloater:first')
      floater.hide()

  # Create a link that toggles the floater.
  # When floater visible, focus on text field.
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
      floater = $(@).nextAll('.autocompleteFloater:first')
      floater.show()
      if floater.is(':visible')
        textField = floater.children('input:text')
        textField.val('')
        textField.focus()
    link

  # Generate jQuery autocomplete to floater text fields.
  # When an option is selected, the select tag will automatically select the matching option.
  # The floater is then hidden.
  autocomplete: (selectTag) ->
    # Get options to populate autocomplete.
    optionStrings = selectTag.children('option').map(->
      $(@).html()
    ).get()
    # Add jQuery autocomplete to text field.
    textField = selectTag.nextAll('.autocompleteFloater:first').children('input:text')
    textField.autocomplete
      source: optionStrings
      select: (event, ui) ->
        # Find the matching option in the select tag and change it to selected.
        selected = ui.item.value
        floater = $(@).parents('.autocompleteFloater')
        selectTag = floater.prevAll('select:first')
        # Iterate through each option.
        # When matching option found, select it in the select tag.
        selectTag.children('option').each ->
          option = $(@)
          if option.text() == selected
            selectTag.val(parseInt(option.val()))
            return false
        # Hide the floater.
        floater.hide()
        # Focus on select tag.
        selectTag.focus()

}
