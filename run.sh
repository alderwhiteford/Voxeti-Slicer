cd CuraEngine/
conan install . --build=missing --update
cmake --preset release
cmake --build --preset release
cd ../backend
go run main.go
