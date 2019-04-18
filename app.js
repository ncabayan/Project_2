var defaultURL = "/twitch_data";
function optionChanged(selection){    
    d3.json(defaultURL).then(function(data){
        console.log(data);
        var filter = data.filter(d => d.player_name == selection);
        console.log(filter);
        //var data = [data];
        //var layout = {margin: { t: 30, b: 100}};
        var trace1 = {
            x: filter.map(d => d.follower_ping),
            y: filter.map(d => d.follower_count),
            mode: 'lines',
            type: 'scatter'
        }
        var filterdata = [trace1]
        Plotly.plot('streamer', filterdata);
})}

function getData(route){
    console.log(route);
    d3.json(`/${route}`).then(function(data){
        console.log("newdata", data);
        updatePlotly(data);
    });
}