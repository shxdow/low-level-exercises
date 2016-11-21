#include <windows.h>

_IMAGE_SECTION_HEADER __stdcall * sub_10BB2(char * pe_file)
{	
	/* Get a pointer to the beginning of the DOS_HEADER */
	IMAGE_DOS_HEADER * dos_header = (IMAGE_DOS_HEADER * ) pe_file;
	
	/* Get a pointer to the beginning of the PE_HEADER */
	_IMAGE_NT_HEADERS * pe_header = (_IMAGE_NT_HEADERS *) dos_header->e_lfanew;
	
	/* Get PE Optional header size */
	unsigned __int8 opt_header_size = pe_header->FileHeader.SizeOfOptionalHeader; 
	
	/* Get a pointer to the beginning of the SECTION_HEADER */
	_IMAGE_SECTION_HEADER * section_header = pe_header + \
											 sizeof(_IMAGE_NT_HEADERS) + \
											 opt_header_size;
	
	/* Get a pointer to the beginning of the SECTION_HEADER */
	if (pe_header->FileHeader.NumberOfSections <= 0)
	{
		return NULL;
	}
	
	/* Loop looking for something */
	for (int i = 0;i < pe_header->FileHeader.NumberOfSections ;++i)
	{
		if (dword_169A4(section_header, <something else>) == 0)
		{
			/* We found <whatever we're looking for> */)
			return section_header;
		} else {
			/* Increase the section pointer by sizeof(section_header) */
			section_header += sizeof(_IMAGE_SECTION_HEADER);
		}
	}
}