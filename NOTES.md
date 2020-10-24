Weather api output after json parsing

``` ruby
[1] pry(WeatherService)> data
=> {"coord"=>{"lon"=>-69.86, "lat"=>43.77},
 "weather"=>[{"id"=>802, "main"=>"Clouds", "description"=>"scattered clouds", "icon"=>"03d"}],
 "base"=>"stations",
 "main"=>{"temp"=>286.48, "feels_like"=>286.25, "temp_min"=>286.48, "temp_max"=>286.48, "pressure"=>1025, "humidity"=>81},
 "visibility"=>10000,
 "wind"=>{"speed"=>0.45, "deg"=>132, "gust"=>1.79},
 "clouds"=>{"all"=>37},
 "dt"=>1603465828,
 "sys"=>{"type"=>3, "id"=>2035567, "country"=>"US", "sunrise"=>1603451055, "sunset"=>1603489371},
 "timezone"=>-14400,
 "id"=>0,
 "name"=>"Sebasco Estates",
 "cod"=>200}
 ```


 facade get forecast
 ``` ruby
 [1] pry(WeatherFacade)> destination_data
=> {:temp=>286.89, :temp_min=>285.37, :temp_max=>287.59, :description=>"broken clouds"}
```

Dione's advice

Create a destination facade
  weather
  image (i would have to update the destination)
