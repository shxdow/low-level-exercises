// thumb mode code
//

int mistery8 (char * arg0, char * arg1, int size) {

	int i = 0;

	while (size > 0) {
			--size;
			if ( (arg0[i] != '\0') && (arg0[i] == arg1[i]) ) {
					++i;
			}
	}
	if (size >= 0) {
			return arg0[i] - arg1[i];
	}
	return 0;
}
