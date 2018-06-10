#include <ntddk.h>
#include <wdf.h>

NTSTATUS DriverEntry(PDRIVER_OBJECT DriverObject, PUNICODE_STRING RegistryPath);
VOID routine();

VOID routine() {
	KdBreakPoint();
	DbgPrint("[*] thread created\n");
}

NTSTATUS DriverEntry(PDRIVER_OBJECT DriverObject, PUNICODE_STRING RegistryPath) {
	NTSTATUS status;
	HANDLE threadHandle;

	UNREFERENCED_PARAMETER(RegistryPath);
	UNREFERENCED_PARAMETER(DriverObject);

	KdBreakPoint();

	status = PsCreateSystemThread(
		&threadHandle,
		DELETE,
		0,
		0,
		0,
		(PKSTART_ROUTINE)routine,
		NULL
	);

	if (status != STATUS_SUCCESS) {
		DbgPrint("[!] thread not created successfully");
	}

	return status;
}
