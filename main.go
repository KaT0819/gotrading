package main

import (
	"fmt"
	"log"
	"gotrading/app/controllers"
	"gotrading/config"
	"gotrading/utils"
)

func main() {
	fmt.Println("--------- main start -----------")
	utils.LoggingSettings(config.Config.LogFile)
	controllers.StreamIngestionData()
	controllers.StartWebServer()
	log.Println(controllers.StartWebServer())

	fmt.Println("--------- main end -----------")
}
