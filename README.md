# jQuery-selectTagAutcompleteFloater

link to gihub...

## Description

Often times a form that uses a select tag has too many options. Often times the solution is to convert it into a jQuery autocomplete text field. However, this poses a problem when the value of the select option is different than the value (what is shown on the page). For example, this is common in Rails applications where an association is represented as a select tag where the name of the association is visible on the page, but the important data is the id of the association that the select tag assigns when an option is selected. This plugin attempts to fix this by unobtrusively adding an autocomplete floater that controls the selection while leaving the original select tag intact.

The select tag will be accompanied by the jQuery autocomplete you would normally use. When a selection is made, the autocomplete disappears, and the select tag will have the proper option selected.

## Usage

// Assuming you have included all necessary jQuery UI components required for autocomplete...
$('#select_tag_by_id').autocompleteFloater()
