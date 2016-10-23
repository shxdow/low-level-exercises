cd C:\Program Files (x86)\Windows Kits\10\Debuggers\x86
kd -y srv*c:\symbols*https://msdl.microsoft.com/download/symbols -k com:port=\\.\pipe\com_1,pipe
::kd -k com:port=\\.\pipe\com_1,pipe
