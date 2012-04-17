# jQuery-selectTagAutocompleteFloater

https://github.com/ordinaryzelig/jquery-autocompleteFloater

## Demo

http://ordinaryzelig.github.com/jquery-autocompleteFloater/

## Description

* Unobtrusively add jQuery autocomplete functionality to a select tag.
* A link will be added. When clicked, the autocomplete floater appears.
* This autocomplete works just like the normal jQuery-UI autocomplete.
* When a selection is made, the select tag will change to it.
* The select tag never changes, leaving your form as it always was.

## Rationale

Consider the following select tag:

```html
<select>
  <option value="1">Volvo</option>
  <option value="2">Saab</option>
  <option value="3">Mercedes</option>
  <option value="4">Audi</option>
</select>
```

The important data to send when the form is submitted are the values (the numbers). If we were to use jQuery's autocomplete alone, we would have a text field that would store the text of the option (the car company). That's not useful.

It's common in Rails forms for select tags to represent associations:

```erb
<%= form_for @article do |f| %>
  <%= f.collection_select :user_id, User.all, :id, :name, {}, class: 'autocomplete' %>
<% end %>
```

This plugin will unobtrusively add autocomplete functionality.

```javascript
$('.autocomplete').autocompleteFloater()
```

The above code will add a small link next to the select tag. When clicked, a text field will appear. This text field uses the standard jQuery autocomplete plugin. When a selection is made, the autocomplete disappears, and the select tag will have the proper option selected.

## Usage

What you need:

* jQuery (1.7.2 is included in `vendor/`)
* jQuery-UI and "stuff" (custom 1.8.18 is included in `vendor/`. Includes minimum jQuery-UI modules needed for autocomplete: core, widget, position, autocomplete)
* `jquery-selectTagAutocompleteFloater.js` (prettier CoffeeScript version available too)
* `jquery-selectTagAutocompleteFloater.css`

```javascript
$('.selectTagSelector').autocompleteFloater()
```
### Options

#### jQueryAutocompleteOptions

Options you would normally pass to jQuery's autocomplete.

```javascript
// Require at least 3 characters to activate autocomplete.
$('select').autocompleteFloater({jQueryAutocompleteOptions: {minLength: 3}})
```

### Gotchas

* Be sure your select tag doesn't have duplicate entries. The first matching option will be selected.

## TODO

* Fix failing test for selecting option. The click() is not causing jasmine to behave correctly.
* Wrap in ruby gem.
* Handle duplicate options (not tested, but currently, it will probably choose the first one).
