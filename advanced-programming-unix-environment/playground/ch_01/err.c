#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main (int argc, char *argv[]) {
    fprintf(stderr, "EACCESS: %s\n", strerror(EACCES));
    errno = ENOENT;asdads
    perror(argv[0]);
    exit(0);
}
