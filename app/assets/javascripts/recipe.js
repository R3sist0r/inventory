recipe_template = '\
	<fieldset class="inputs">\
	<legend>\
		<span>Recipe</span>\
	</legend>\
	<ol>\
	{{#each line}}\
	<li class="select input optional"><label class=" label"">{{name}}</label>\
	<select onchange="lockRecipe()" id="production_run_recipe_ingredient" name="stock_line[{{material_id}}]">\
		{{#each stock}}\
			<option value="{{batch_id}}">{{batch_code}}</option>\
		{{/each}}\
	</select>\
	</li>\
	{{/each}}\
	</ol></fieldset>\
';


function loadRecipe() {
	recipe_id =	$('#production_run_recipe_id').val();
	$.getJSON('/api/production_recipe/'+recipe_id, function(data) {
		var template = Handlebars.compile(recipe_template);
		var html = template({line: data});
		$(html).insertAfter('#main_content form .inputs');
	});
}

function lockRecipe() {
	$('#production_run_recipe_id').prop("disabled", true);
}

