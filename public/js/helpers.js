function buildIngredient(ingredientName, ingredientId) {
  // gets Ingredient Template stored in DOM
  // Finds the ingredient_template that is hidden and gets the template contents
  var ingredientTemplate = $.trim($('.ingredient-template').html());
  // Creates an jQueryDOMElement from the ingredientTemplate
  var $ingredient = $(ingredientTemplate);
  // Modifies its text to use the passed-in ingredientName
  $ingredient.prepend(ingredientName).attr("id", ingredientId);
  // Returns the jQueryDOMElement to be used elsewhere
  return $ingredient
}