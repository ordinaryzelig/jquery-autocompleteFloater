(function() {
  '=========================';
  'autocompleteFloater';
  '';
  'https://github.com/ordinaryzelig/jquery-autocompleteFloater';
  '=========================';
  var autocompleteFloaterFunctions;

  $.fn.autocompleteFloater = function() {
    var floater, linkToShowFloater, selectTags;
    selectTags = this;
    linkToShowFloater = autocompleteFloaterFunctions.createLinktoShowFloater();
    selectTags.after(linkToShowFloater);
    floater = autocompleteFloaterFunctions.createFloater();
    linkToShowFloater.after(floater);
    return selectTags.each(function() {
      var optionStrings, selectTag, textField;
      selectTag = $(this);
      optionStrings = selectTag.children('option').map(function() {
        return $(this).html();
      }).get();
      textField = selectTag.siblings('.autocompleteFloater').children('input:text');
      return textField.autocomplete({
        source: optionStrings,
        select: function(event, ui) {
          var selected;
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
        event.preventDefault();
        return $(this).next('.autocompleteFloater').toggle();
      });
      return link;
    }
  };

}).call(this);
