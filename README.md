# jQuery-selectTagAutcompleteFloater

https://github.com/ordinaryzelig/jquery-autocompleteFloater

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

```javascript
// Assuming you have included all necessary jQuery UI components required for autocomplete...
$('.selectTagSelector').autocompleteFloater()
```

## TODO

* Follow good jQuery plugin authorigin practices: http://docs.jquery.com/Plugins/Authoring.
* Live demo.
* Fix failing test for selecting option. The click() is not causing jasmine to behave correctly.