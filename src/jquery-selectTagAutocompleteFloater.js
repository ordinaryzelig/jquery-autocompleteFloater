(function() {
  '=========================';
  'autocompleteFloater';
  '';
  'v0.0.2';
  '';
  'https://github.com/ordinaryzelig/jquery-autocompleteFloater';
  'This software is offered as is without warranty, yada yada.';
  '=========================';
  var autocompleteFloaterFunctions;

  $.fn.autocompleteFloater = function() {
    return this.each(function() {
      var floater, linkToShowFloater, selectTag;
      selectTag = $(this);
      linkToShowFloater = autocompleteFloaterFunctions.createLinktoShowFloater();
      selectTag.after(linkToShowFloater);
      floater = autocompleteFloaterFunctions.createFloater();
      linkToShowFloater.after(floater);
      return autocompleteFloaterFunctions.autocomplete(selectTag);
    });
  };

  autocompleteFloaterFunctions = {
    createFloater: function() {
      var autocompleteTextField, floater;
      floater = $('<div class="autocompleteFloater"></div>');
      floater.hide();
      autocompleteTextField = this.createAutocompleteTextField();
      autocompleteTextField.appendTo(floater);
      return floater;
    },
    createAutocompleteTextField: function(selectTag) {
      return $('<input type="text" />');
    },
    createLinktoShowFloater: function() {
      var link, linkContent;
      linkContent = '+';
      link = $("<a class=\"autocompleteFloaterLink\" href=\"\">\n  " + linkContent + "\n</a>");
      link.click(function(event) {
        var floater, textField;
        event.preventDefault();
        floater = $(this).next('.autocompleteFloater');
        floater.toggle();
        if (floater.is(':visible')) {
          textField = floater.children('input:text');
          textField.val('');
          return textField.focus();
        }
      });
      return link;
    },
    autocomplete: function(selectTag) {
      var optionStrings, textField;
      optionStrings = selectTag.children('option').map(function() {
        return $(this).html();
      }).get();
      textField = selectTag.siblings('.autocompleteFloater').children('input:text');
      return textField.autocomplete({
        source: optionStrings,
        select: function(event, ui) {
          var floater, selected;
          selected = ui.item.value;
          floater = $(this).parents('.autocompleteFloater');
          selectTag = floater.siblings('select');
          selectTag.children('option').each(function() {
            var option;
            option = $(this);
            if (option.text() === selected) {
              selectTag.val(parseInt(option.val()));
              return false;
            }
          });
          return floater.hide();
        }
      });
    }
  };

}).call(this);
