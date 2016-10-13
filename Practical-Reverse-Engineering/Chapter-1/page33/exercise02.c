#include <windows.h>        // windows API
#include <tlhelp32.h>       // 
#include <tchar.h>          // 

struct IDT{
	DWORD64 base;
	WORD  limit;
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
    
    IDT idtRetrieved;
    // PROCESSENTRY32 process;
    // short ret;
    // DWORD tmp

    asm("movl %%esp %0" : "=r" (idtRetrieved) );
   

/*    if(8003F400 < idt && idt > 80047400h){
        return 0;
    }*/
    
    // ret = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
    
}
