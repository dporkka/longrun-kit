/*
 * longrun: tiny C99 reference program
 * - Prints version
 * - Runs self-test by reading tests/test_vectors.txt (each line echoed)
 * Build: ./scripts/build.sh
 */
#include <stdio.h>
#include <string.h>

#define LONGRUN_VERSION "1.0.0"

int selftest(void) {
    FILE* f = fopen("tests/test_vectors.txt", "r");
    if (!f) {
        fprintf(stderr, "selftest: cannot open tests/test_vectors.txt\n");
        return 2;
    }
    char buf[4096];
    int n = 0;
    while (fgets(buf, sizeof(buf), f)) {
        size_t len = strlen(buf);
        // strip trailing newline
        if (len && (buf[len-1] == '\n' || buf[len-1] == '\r')) {
            while (len && (buf[len-1] == '\n' || buf[len-1] == '\r')) { buf[--len] = '\0'; }
        }
        // For demo: just echo the line to stdout prefixed
        printf("VECTOR[%d]: %s\n", n, buf);
        n++;
    }
    fclose(f);
    printf("Self-test completed: %d vectors.\n", n);
    return 0;
}

int main(int argc, char** argv) {
    if (argc > 1) {
        if (strcmp(argv[1], "--version") == 0) {
            printf("longrun %s\n", LONGRUN_VERSION);
            return 0;
        }
        if (strcmp(argv[1], "--selftest") == 0) {
            return selftest();
        }
    }
    printf("longrun %s\n", LONGRUN_VERSION);
    printf("Usage: longrun [--version|--selftest]\n");
    return 0;
}
