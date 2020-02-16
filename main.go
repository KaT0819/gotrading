package main

import (
	"fmt"
	"gotrading/app/controllers"
	"gotrading/config"
	"gotrading/utils"
	"log"
)

func main() {
	fmt.Println("--------- main start -----------")
	utils.LoggingSettings(config.Config.LogFile)
	controllers.StreamIngestionData()
	log.Println(controllers.StartWebServer())

	fmt.Println("--------- main end -----------")
}
