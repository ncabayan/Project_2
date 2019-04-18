var defaultURL = "/twitch_data";
d3.json(defaultURL).then(function(data){
	var data= [data];
	var layout = {margin: { t: 30, b: 100}};
	Plotly.plot('scatter', data, layout);
});
function updatePlotly(newdata){
	Plotly.restyle('scatter', 'x', [newdata.x]);
	Plotly.restyle('scatter', 'y', [newdata.y]);
}

function getData(route){
	console.log(route);
	d3.json(`/${route}`).then(function(data){
		console.log("newdata", data);
		updatePlotly(data);
	});
}