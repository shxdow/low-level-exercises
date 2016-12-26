// thumb mode code
// this is a strcmp

int mistery9(char * arg0, char * arg1) {
	int i = 0;

	while ( (arg0[i] == arg1[i]) && (arg0[i] != '\0') ) {
		i++;
	}
	return arg0[i] - arg1[i];
}
