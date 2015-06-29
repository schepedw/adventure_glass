$(function(){
  //TODO: remove filestyle
  $('.best_in_place').best_in_place();
  $('#fileupload').fileupload({
    dataType: 'json',
    done: function (e, data) {
      $.each(data.result.files, function (index, file) {
        $('<p/>').text(file.name).appendTo(document.body);
      });
    }
  });
});

String.prototype.capitalize = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

function selectableObject(options){
  this.options = options;
  this.select = function(boolFunction){
    result = {};
    for (property in this.options){
      if (this.options.hasOwnProperty(property)){
        selected = boolFunction(property);
        result[property] = selected;
      }
    }
    return new selectableObject(result);
  }

  this.except = function(exception){
    result = {};
    for (property in this.options){
      if (this.options.hasOwnProperty(property) && property != exception){
        result[property] = options[property];
      }
    }
    return new selectableObject(result);
  }

  this.empty = function(){
    for (property in this.options){
      if (this.options.hasOwnProperty(property) && options[property]){
        return false;
      }
    }
    return true;

  }

  this.replaceEmptyWithNull = function(){
    for (category in this.options)
      if (this.options[category] == "")
        this.options[category]= null;
  }
}

