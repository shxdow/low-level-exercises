#include <windows.h>        // windows API
// #include <tlhelp32.h>
// #include <tchar.h>
// #include <intrin.h>
#include <iostream>

struct IDTR{		// struct rappresenting IDT register
	WORD  limit;
	DWORD64 base;
};

BOOL __stdcall DllMain(HINSTANCE hinstDLL, DWORD fdwReason,LPVOID lpvReserved);

int main()
{
    HINSTANCE hinstDLL;
    DWORD fwdReason;
    LPVOID lpvReserved;

    DllMain(hinstDLL,fwdReason,lpvReserved);
    return 0;
}

BOOL __stdcall DllMain(HINSTANCE hinstDLL, DWORD fdwReason,LPVOID lpvReserved){
    
	IDTR idt;
	// PROCESSENTRY32 process;
    	__asm__ volatile( "sidt %0" : "=m" (idt) ); 
  
	std::cout << "Limit:\t" << idt.limit << "\n";
	std::cout << "Base:\t" << std::hex << idt.base << std::endl;
	
	if(0x8003F400 < idt.limit && idt.limit > 0x80047400){
		std::cout << "ret 0" << std::endl;
        	return 0;
	}

    
    // ret = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
    
}
