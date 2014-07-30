$(document).ready(function () {  
	$('.add-ingredient').on('click', addIngredient);
	$('.find-recipes').on('click', findRecipes);
	$('.delete-ingredient').on('click', deleteIngredient);
});

function addIngredient(event){
	event.preventDefault();

	var newIngredient = $('#new-ingredient').val();
	$('#new-ingredient').val("");

	var userId = parseInt($('div.user-id').attr("value"));

	var request = $.ajax({
		url: '/ingredients', 
		type: 'POST',
		data: {
			user_id: userId,
			ingredient_name: newIngredient
		}
	})
	request.done(addIngredientDOM);
}

function addIngredientDOM(data){
	var ingredientId = JSON.parse(data).ingredient_id;
	var ingredientName = JSON.parse(data).ingredient_name;
	var ingredientItem = buildIngredient(ingredientName, ingredientId);

	$('.ingredient-list').append(ingredientItem);
}

function deleteIngredient(event){
	event.preventDefault();

	var ingredientId = parseInt($(this).closest("li").attr("id"));

	var request = $.ajax({
		url: '/ingredients',
		type: 'DELETE',
		data: { ingredient_id: ingredientId }
	})
	request.done(deleteIngredientDOM);
}

function deleteIngredientDOM(data){
	var ingredientId = JSON.parse(data).ingredient_id;
	$("li#"+ingredientId).remove();
}

function findRecipes(event){
	event.preventDefault();

	
}