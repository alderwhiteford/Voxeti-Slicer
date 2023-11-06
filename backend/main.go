package main

import (
	"fmt"
	"os"
	"context"
	"main/controller"
	"net/http"
	"os/signal"
	"time"

	"github.com/labstack/echo/v4"
	"github.com/labstack/gommon/log"
	"github.com/pterm/pterm"
)

func main() {
	port := 3000

	// Initialize an echo instance:
	e := echo.New()
	e.HideBanner = true
	logger := e.Logger
	logger.SetLevel(log.INFO)
	logger.SetHeader("")

	pterm.Printfln("Spinning up server on port %d", port)
	// Go routine to spin up the backend on port :3000
	go func() {
		if err := e.Start(fmt.Sprintf(":%d", port)); err != nil && err != http.ErrServerClosed {
			pterm.Fatal.WithFatal(false).Println(err)
			os.Exit(1)
		}
	}()

	pterm.Println("Registering Backend Routes")
	api := e.Group("/api")
	// Register the backend routes:
	controller.RegisterBackendHandlers(api, logger)

	// Graceful shutdown:
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	pterm.Println("\nShutting down server...")
	if err := e.Shutdown(ctx); err != nil {
		e.Logger.Fatal(err)
	}
}