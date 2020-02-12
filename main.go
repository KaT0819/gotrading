package main

import (
	"fmt"
	"gotrading/app/controllers"
	"gotrading/config"
	"gotrading/utils"
)

func main() {
	fmt.Println("--------- main start -----------")
	utils.LoggingSettings(config.Config.LogFile)
	controllers.StreamIngestionData()
	controllers.StartWebServer()
	fmt.Println("--------- main end -----------")
}
