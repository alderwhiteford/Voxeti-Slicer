package controller

import (
	"main/model"
	"main/utilities"
	"net/http"

	"github.com/labstack/echo/v4"
)

func RegisterBackendHandlers(e *echo.Group, logger echo.Logger) {
	api := e.Group("/slicer")

	// Submit an STL file for slicing:
	api.POST("/", func(c echo.Context) error {
		// Extract the file from the request:
		file, err := c.FormFile("file")
		if err != nil {
			return c.JSON(utilities.CreateErrorResponse(400, "No file has been provided to the request"))
		}

		// Basic STL validation:
		fileType, errResponse := model.ValidateSTLFile(file)
		if errResponse != nil {
			return c.JSON(utilities.CreateErrorResponse(errResponse.Code, errResponse.Message));
		}

		output, errResponse := model.SliceSTLFile(*fileType, file, logger)
		if errResponse != nil {
			return c.JSON(utilities.CreateErrorResponse(errResponse.Code, errResponse.Message));
		}

		jsonOutput, errResponse := model.ParseSliceOutput(*output, file.Filename)
		if (errResponse != nil) {
			return c.JSON(utilities.CreateErrorResponse(errResponse.Code, errResponse.Message));
		}

		return c.JSON(http.StatusOK, jsonOutput)
	})

	api.GET("/", func(c echo.Context) error {
		logger.Info("Healthcheck endpoint hit!")
		
		return c.NoContent(http.StatusOK)
	})
}