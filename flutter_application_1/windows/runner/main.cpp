#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <windows.h>
#include <dwmapi.h>

#include "flutter_window.h"
#include "utils.h"

#pragma comment(lib, "Dwmapi.lib")

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command)
{
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(L"flutter_application_1", origin, size)) {
    return EXIT_FAILURE;
  }

  HWND hwnd = window.GetHandle();
  LONG style = GetWindowLong(hwnd, GWL_EXSTYLE);
  SetWindowLong(hwnd, GWL_EXSTYLE, style | WS_EX_LAYERED);
  SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA);

  DWM_BLURBEHIND blurBehind = {0};
  blurBehind.dwFlags = DWM_BB_ENABLE;
  blurBehind.fEnable = TRUE;
  blurBehind.hRgnBlur = NULL;
  DwmEnableBlurBehindWindow(hwnd, &blurBehind);

  window.SetQuitOnClose(true);
  window.Show();

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
