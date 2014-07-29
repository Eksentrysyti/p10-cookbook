$(document).ready(function () {  
	$('.add-ingredient').on('click', addIngredient);
	$('.find-recipes').on('click', findRecipes);
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

function findRecipes(event){
	event.preventDefault();

	
}