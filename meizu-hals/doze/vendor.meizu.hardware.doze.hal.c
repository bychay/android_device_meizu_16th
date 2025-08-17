#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#define DOZE_FILE "/sys/class/meizu/lcm/display/doze_s2"
#define FLAG_FILE "/data/vendor/display/meizu_doze_active"

void* delayed_doze_enable(void* arg) {
    sleep(5);

    FILE* flag = fopen(FLAG_FILE, "r");
    if (flag != NULL) {
        char state[2] = {0};
        fread(state, 1, 1, flag);
        fclose(flag);

        if (state[0] == '1') {
            FILE* doze = fopen(DOZE_FILE, "w");
            if (doze != NULL) {
                fputs("1", doze);
                fclose(doze);
            }
            remove(FLAG_FILE);
        }
    }

    return NULL;
}

int main() {
    FILE* logcat = popen("logcat -v brief", "r");
    if (logcat == NULL) {
        perror("popen failed");
        return 1;
    }

    char line[1024];

    while (fgets(line, sizeof(line), logcat) != NULL) {
        if (strstr(line, "Starting dream")) {
            FILE* flag = fopen(FLAG_FILE, "w");
            if (flag != NULL) {
                fputs("1", flag);
                fclose(flag);
            }

            pthread_t thread;
            if (pthread_create(&thread, NULL, delayed_doze_enable, NULL) == 0) {
                pthread_detach(thread);
            }

        } else if (strstr(line, "Stopping dream")) {
            FILE* flag = fopen(FLAG_FILE, "w");
            if (flag != NULL) {
                fputs("0", flag);
                fclose(flag);
            }
        }
    }

    pclose(logcat);
    return 0;
}