// Copyright (c) 2022 Ultimaker B.V.
// CuraEngine is released under the terms of the AGPLv3 or higher

#include <iostream> //To change the formatting of std::cerr.
#include <signal.h> //For floating point exceptions.
#if defined(__linux__) || (defined(__APPLE__) && defined(__MACH__))
#include <sys/resource.h> //For setpriority.
#endif

#include <spdlog/spdlog.h>

#include "Application.h"

namespace cura
{

// Signal handler for a "floating point exception", which can also be integer division by zero errors.
void signal_FPE(int n)
{
    (void)n;
    spdlog::error("Arithmetic exception.");
    exit(1);
}

} // namespace cura

int main(int argc, char** argv)
{
#if defined(__linux__) || (defined(__APPLE__) && defined(__MACH__))
    // Lower the process priority on linux and mac. On windows this is done on process creation from the GUI.
    setpriority(PRIO_PROCESS, 0, 10);
#endif

#ifndef DEBUG
    // Register the exception handling for arithmetic exceptions, this prevents the "something went wrong" dialog on windows to pop up on a division by zero.
    signal(SIGFPE, cura::signal_FPE);
#endif
    // Set the file type:
    const char* type;
    if (argc >= 3 && argv[2][1] == 'b') {
        type = "w+b";
    } else if (argc >= 3 && argv[2][1] == 't') {
        type = "w+t";
    } else {
        spdlog::error("Invalid file type!");
        exit(1);
    }
    
    // Retrieve the file size:
    const int fileSize = (argc >= 4) ? std::stoi(argv[3]) : -1;

    if (fileSize == -1) {
        spdlog::error("Invalid file size or no file size provided!");
        exit(1);
    }

    char* buffer = (fileSize < 10000000) ? new char[fileSize] : (char*)malloc(fileSize);
    size_t bytesRead = 0;
    size_t totalBytes = 0;

    const char* settings = "../CuraEngine/machines/definitions/creality_ender3.def.json";

    // Open the file V2:
    FILE* file = fmemopen(buffer, fileSize, "w+");

    if (file == nullptr) {
        perror("fmemopen");
        return EXIT_FAILURE;
    }

    while ((bytesRead = fread(buffer, 1, fileSize, stdin)) > 0) {
        fwrite(buffer, 1, bytesRead, file);
    }

    rewind(file);

    std::cerr << std::boolalpha;
    
    cura::Application::getInstance().run(settings, file, type);

    return 0;
}
