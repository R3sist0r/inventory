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
			{{#valueIsSelected batch_id ../selected}}\
			<option value="{{batch_id}}" selected>{{batch_code}}</option>\
			{{else}}\
			<option value="{{batch_id}}">{{batch_code}}</option>\
			{{/valueIsSelected}}\
		{{/each}}\
	</select>\
	</li>\
	{{/each}}\
	</ol></fieldset>\
';

function loadRecipe() {
	recipe_id =	$('#production_run_recipe_id').val();
	$.getJSON('/api/production_recipe/'+recipe_id, function(data) {
		Handlebars.registerHelper('valueIsSelected', function(batch_id,selected, options) {
    		return options.inverse(this);
		});
		var template = Handlebars.compile(recipe_template);
		var html = template({line: data});
		$(html).insertAfter('#main_content form .inputs');
	});
}


function loadRecipeEdit(production_run_id) {
	$.getJSON('/api/production_run/'+production_run_id, function(data) {
		Handlebars.registerHelper('valueIsSelected', function(batch_id,selected, options) {
		  	if( batch_id == selected ) {
        		return options.inverse(this);
    		} else {
        		return options.fn(this);
    		}
		});
		var template = Handlebars.compile(recipe_template);
		var html = template({line: data});
		$(html).insertAfter('#main_content form .inputs');
	});
}

function lockRecipe() {
	$('#production_run_recipe_id').prop("disabled", true);
}
