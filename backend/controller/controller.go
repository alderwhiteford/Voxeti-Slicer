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
		// Read the body of the request:
		binary := c.FormValue("binary")
		if binary == "" {
			return c.JSON(utilities.CreateErrorResponse(400, "Please provide binary form field to specify file type!"))
		}

		// Extract the file from the request:
		file, err := c.FormFile("file")
		if err != nil {
			return c.JSON(utilities.CreateErrorResponse(400, "No file has been provided to the request"))
		}

		// Basic STL validation:
		errResponse := model.ValidateSTLFile(file)
		if errResponse != nil {
			return c.JSON(utilities.CreateErrorResponse(errResponse.Code, errResponse.Message));
		}

		output, errResponse := model.SliceSTLFile(binary, file)
		if errResponse != nil {
			return c.JSON(utilities.CreateErrorResponse(errResponse.Code, errResponse.Message));
		}

		jsonOutput, errResponse := model.ParseSliceOutput(*output)
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