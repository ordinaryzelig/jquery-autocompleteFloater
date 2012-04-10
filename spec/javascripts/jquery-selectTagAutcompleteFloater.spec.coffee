describe 'asdf', ->

  # Generate selectTag, add to body.
  beforeEach ->
    html = """
      <select>
        <option value="1">Volvo</option>
        <option value="2">Saab</option>
        <option value="3">Mercedes</option>
        <option value="4">Audi</option>
      </select>
    """
    @selectTag = $(html)
    @selectTag.appendTo('body')

  afterEach ->
    # Start fresh.
    # Is there a way to start with a fresh "request" each time?
    $('body').html('')

  describe '.autocompleteFloater()', ->

    beforeEach ->
      @selectTag.autocompleteFloater()
      @floater = $('.autocompleteFloater')
      @textField = @floater.find('input:text')

    it 'adds link next to select tag to show floater', ->
      expect(@selectTag.next('a.autocompleteFloaterLink').length).toEqual(1)

    it 'adds hidden floater div', ->
      expect($('.autocompleteFloater:hidden').length).toEqual(1)

    it 'adds text input with jQuery autocomplete functionality', ->
      expect(@textField.length).toEqual(1)
      @textField.autocomplete('search', 'sa') # As if typing 'saab' to trigger jQuery autocomplete.
      expect($('.ui-autocomplete:visible').length).toEqual(1)

    it 'automatically changes the select tag value when something chosen', ->
      @textField.autocomplete('search', 'sa')
      link = $('.ui-autocomplete li a:first')
      # This fails.
      link.click()
      expect(@selectTag.val()).toEqual(2)
