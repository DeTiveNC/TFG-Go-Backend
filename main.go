package main

import (
	"TFG-Go-Backend/api-obtainer"
	"TFG-Go-Backend/cronjob"
)

func main() {
	// First api-obtencion
	api_obtainer.ApiObtainer()
	// Execute the cronjob
	cronjob.Cronjob()
}
