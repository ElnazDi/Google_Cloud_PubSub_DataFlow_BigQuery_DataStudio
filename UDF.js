function transform(line) {
    var values = line.split(',');
    var obj = {
        "lsoa_code" : values[0],
        "borough" : values[1],
        "major_category" : values[2],
        "minor_category" : values[3],
        "value" : Math.round(Number(values[4])),
        "year" : Math.round(Number(values[5])),
        "month" : Math.round(Number(values[6])),
    };
var jsonString = JSON.stringify(obj);
return jsonString;
}