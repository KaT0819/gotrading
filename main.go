package main

import (
	"fmt"
	"gotrading/bitflyer"
	"gotrading/config"
	"gotrading/utils"
	"log"
	"time"
)

func main() {
	fmt.Println("--------- main start -----------")
	utils.LoggingSettings(config.Config.LogFile)
	log.Println("test")
	apiClient := bitflyer.New(config.Config.ApiKey, config.Config.ApiSecret)
	// fmt.Println(apiClient.GetBalance())
	ticker, _ := apiClient.GetTicker("BTC_USD")
	fmt.Println(ticker)
	fmt.Println(ticker.GetMidPrice())
	fmt.Println(ticker.DateTime())
	fmt.Println(ticker.TruncateDateTime(time.Hour))
	fmt.Println("--------- main end -----------")
}
