package utilities

var FILE_MAX_SIZE int64 = 1000000 * 50 // (bytes * # of megabytes)

type ErrorResponse struct {
	Code int
	Message string
}

type SliceData struct {
	File					    string  `json:"file"`
	Flavor            string  `json:"flavor"`
	TimeS             int     `json:"time"`
	FilamentUsed      float32 `json:"filamentused"`
	LayerHeight       float32 `json:"layerheight"`
	MinX              float32 `json:"minx"`
	MinY              float32 `json:"miny"`
	MinZ              float32 `json:"minz"`
	MaxX              float32 `json:"maxx"`
	MaxY              float32 `json:"maxy"`
	MaxZ              float32 `json:"maxz"`
	TargetMachineName string  `json:"targetmachinename"`
}
