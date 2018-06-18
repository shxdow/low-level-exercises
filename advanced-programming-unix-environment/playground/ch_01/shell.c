#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/wait.h>
#include <signal.h>

#define MAXLINE 80

static void sig_int(int);

int main (int argc, char **argv){

	char buf[MAXLINE];
	pid_t pid;
	int status;
    
    if (signal(SIGINT, sig_int) == SIG_ERR)
        printf("signal error");

	printf("%%");
	while (fgets(buf, MAXLINE, stdin) != NULL) {
		if (buf[strlen(buf) - 1] == '\n')
			buf[strlen(buf) - 1] = 0;

		if ((pid = fork()) < 0) {
			perror(argv[0]);
		} else if (pid == 0) { /* child */
			execlp(buf, buf, (char *)0);
			perror(argv[0]);
			exit(127);
		}
		/* parent */
		if ((pid = waitpid(pid, &status, 0)) < 0)
			perror(argv[0]);
		printf("%%");
	}

	exit(0);
}

void sig_int (int signo) {
    printf("interrupt\n%% ");
}
