// thumb mode code
//
// arg0: is never read from,and there's no way to infer it's type.
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

uint32_t mistery10 (arg0,uint32_t arg1, _STRUCT * arg2) {
	
	uint32_t bytes_written = 0;
			 
	if (arg1 >= 0x10) {									// 32 - 16
			GetSystemTime(arg2);
			bytes_written = sizeof(SYSTEM);
	}
	// line 24
	if ((arg1 - bytes_written) >= 4) {					// 32 - 16
			arg2.dwProcessId = GetCurrentProcessId();
			bytes_written += sizeof(DWORD);
	}

	// line 37
	if ((arg1 - bytes_written) >= 4) {					// 32 - 20
			arg2.dwTickCount = GetTickCount();
			bytes_written += sizeof(DWORD);
	}

	// line 46
	if ((arg1 - bytes_written) >= 8) {					// 32 - 24
			arg2.liPerformanceCounter = QueryPerformanceCounter();
			bytes_written += sizeof(LARGE_INTEGER);
	}

	return bytes_written;
}
