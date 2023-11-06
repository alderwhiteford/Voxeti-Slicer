package utilities

func CreateErrorResponse(code int, message string) (int, map[string]ErrorResponse) {
	errorResponse := map[string]ErrorResponse{
		"error": {
			Code:    code,
			Message: message,
		},
	}
	return code, errorResponse
}