// Package weather contains a function to print the forecast (weather
// condition) at a location along with storing the last seen weather condition
// at a location.
//
// Implementation details: Forecast mutates the public package variables
// CurrentCondition and CurrentLocation.
package weather

// CurrentCondition is the last weather condition that was set.
var CurrentCondition string
// CurrentLocation is the last location for weather that was set.
var CurrentLocation string

// Forecast returns a pretty string for the given weather condition in the
// given city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
