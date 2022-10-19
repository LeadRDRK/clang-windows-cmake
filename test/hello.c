#define WIN32_LEAN_AND_MEAN
#include <windows.h>

int APIENTRY WinMain(HINSTANCE hInst, HINSTANCE hInstPrev, PSTR cmdline, int cmdshow)
{
    return MessageBox(NULL, "Hello world!", "Test", MB_ICONINFORMATION | MB_OK);
}
