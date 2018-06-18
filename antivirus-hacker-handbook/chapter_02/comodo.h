void * load_framework () {
	ssize_t file_size; // eax@1
	char *dir_name; // eax@2
	int *v2; // eax@3
	char *v3; // eax@3
	void *v4; // eax@6
	void *CreateInstance; // eax@7
	char *dl_error; // eax@9
	char buf[2052]; // [sp+14h] [bp-804h]@1


	// Check that cmdscan exists on disk
	file_size = readlink("/proc/self/exe", buf, 0x800u);
	if ( file_size == -1 ||  ) {
		v2 = __errno_location();
		v3 = strerror(*v2);
		LABEL_4:
		fprintf(stderr, "%s\n", v3);
		exit(1);
	}

	buf[file_size] = 0;
	// Change directory and go to cmdscan
	dir_name = dirname(buf);
	chdir(dir_name);

	handle = dlopen("./libFRAMEWORK.so", 1);
	
	if ( !handle ) {
		dl_error = dlerror();
		fprintf(stderr, "error is %s\n", dl_error);
		goto LABEL_10;
	}

	// Retrieve "CreateInstance" function address
	result = dlsym(handle, "CreateInstance");
	FnCreateInstance = (int (__fastcall *)(_QWORD, _QWORD, _QWORD, _QWORD))CreateInstance;

	if ( !result ) {
		LABEL_10:
		v3 = dlerror();
		goto LABEL_4;
	}
	return CreateInstance;
}

int maybe_IFramework_CreateInstance () {
	const char *v0; // eax@2
	int *v1; // ebx@2
	char *v2; // esi@2
	size_t v3; // eax@2
	int v4; // ecx@2
	int v5; // eax@6
	int v6; // ebx@6
	int result; // eax@6
	int v8; // [sp+0h] [bp-38h]@1
	int v9; // [sp+4h] [bp-34h]@1
	int v10; // [sp+8h] [bp-30h]@1
	int v11; // [sp+8h] [bp-30h]@2
	int v12; // [sp+Ch] [bp-2Ch]@1
	int v13; // [sp+10h] [bp-28h]@0
	int v14; // [sp+14h] [bp-24h]@0
	int v15; // [sp+2Ch] [bp-Ch]@1

	v15 = 0;

	if ( FnCreateInstance (0, 0, 983040, &v15) < 0 ) {
		fwrite("CreateInstance failed!\n", 1u, 0x17u, stderr);
		exit(1);
	}

	v0 = (const char *)get_current_dir_name(v8, v9, v10, v12, v13, v14);
	v3 = strlen(v0);

	if ( (*(int (__cdecl **)(int *, int, void *))(v4 + 20))(v1, v3 + 1, v2) < 0 )
	{
		fwrite("IFrameWork Init failed!\n", 1u, 0x18u, stderr);
		exit(1);
	}
	free(v2);
	LOBYTE(v11) = 0;
	if ( (*(int (__stdcall **)(int, signed int, int))(*(_DWORD *)dword_804C44C + 28))(dword_804C44C, -1, v11) < 0 )
	{
		fwrite("IFrameWork LoadScanners failed!\n", 1u, 0x20u, stderr);
		exit(1);
	}
	if ( (*(int (__stdcall **)(int, int *))(*(_DWORD *)dword_804C44C + 32))(dword_804C44C, &dword_804C448) < 0 )
	{
		fwrite("IFrameWork CreateEngine failed!\n", 1u, 0x20u, stderr);
		exit(1);
	}
	if ( (*(int (__stdcall **)(int, signed int, int *))(*(_DWORD *)dword_804C448 + 40))(
	     dword_804C448,
	     131073,
	     &dword_804C440) < 0 )
	{
		fwrite("IAEEngineDispatch GetBaseComponent failed!\n", 1u, 0x2Bu, stderr);
		exit(1);
	}
	
	pthread_mutex_init((pthread_mutex_t *)(v5 + 136), 0);
	memset((void *)(v6 + 8), 0, 0x7Eu);
	if ( result < 0 )
	{
		fwrite("SetUserCallBack() failed!\n", 1u, 0x1Au, stderr);
		exit(1);
	}
	return result;
}