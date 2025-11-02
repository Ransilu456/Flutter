# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
```js

             VIRTUAL ADDRESS (32 bits)
  _____________________________________________________________
 |                     |                                       |
 |  Virtual Page No.   |          Offset (inside page)         |
 |_____________________|_______________________________________|
        20 bits                        12 bits
        ↑                               ↑
        |                               |
   2^20 pages                     2^12 bytes per page
   = 1,048,576 pages              = 4 KB page size
   = 4 GB virtual address space   (since 2^32 = 4 GB)

                 │
                 │  (1) Page table lookup using Virtual Page Number (VPN)
                 ▼
        ┌──────────────────────────────┐
        │         PAGE TABLE           │
        │   VPN → PFN (Frame Number)   │
        └──────────────────────────────┘
                 │
                 │  (2) Replace VPN with corresponding PFN
                 ▼

             PHYSICAL ADDRESS
  _____________________________________________________________
 |                     |                                       |
 |  Physical Frame No. |       Same Offset as Virtual Addr     |
 |_____________________|_______________________________________|
        18 bits                        12 bits
        ↑                               ↑
        |                               |
   2^18 frames                     2^12 bytes per frame
   = 262,144 frames                = 4 KB frame size
   = 2^30 bytes physical memory = 1 GB total RAM
