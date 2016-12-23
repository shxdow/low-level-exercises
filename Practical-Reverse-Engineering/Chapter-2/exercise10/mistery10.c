// thumb mode code
//
//
//
// arg0: may hold the result
// arg1: is the number that decides which calls are executed.
// arg2: is the structure used in the code.

typedef struct _STRUCT {
  WORD wYear;
  WORD wMonth;
  WORD wDayOfWeek;
  WORD wDay;
  WORD wHour;
  WORD wMinute;
  WORD wSecond;
  WORD wMilliseconds;
  DWORD dwProcessId;
  DWORD dwTickCount;
  LARGE_INTEGER liPerformanceCounter;
}

#include <windows.h>

void mistery10 (arg0,uint32_t arg1, _STRUCT * arg2) {

	if (arg1 >= 0x10) {
			GetSystemTime(arg2);
			arg1 = 0x10;
	}
	// line 24
	if (arg1 >= 4) {
			arg2.dwProcessId = GetCurrentProcessId();
			arg1 += 4;
	}

	// line 37
	if (arg1 >= 4) {
			arg2.dwTickCount = GetTickCount();
			arg1 += 4;
	}

	// line 46
	if (arg1 >= 8) {
			arg2.liPerformanceCounter = QueryPerformanceCounter();
			reg4 += 8;
	}
}
