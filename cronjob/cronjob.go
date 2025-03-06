package cronjob

import (
	"log"
	"time"

	api_obtainer "TFG-Go-Backend/api-obtainer"
	"github.com/robfig/cron/v3"
)

func Cronjob() {
	log.Println("Starting cronjob scheduler...")

	c := cron.New()

	// Run the job daily at 4 am
	_, err := c.AddFunc("0 4 * * *", func() {
		log.Println("Cronjob triggered at:", time.Now().Format("2006-01-02 15:04:05"))
		api_obtainer.ApiObtainer()
	})

	if err != nil {
		log.Println("Error adding cronjob:", err)
		return
	}

	// Start the cron scheduler
	c.Start()
	log.Println("Cronjob scheduler started successfully.")

	// Keep the program running
	select {}
}
