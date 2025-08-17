#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

void show_dim_overlay() {
    system("sf layer create mydim 1080 2160");
    system("sf layer set-color mydim 0 0 0 128");
    system("sf layer set-position mydim 0 0");
    system("sf layer show mydim");
}

void enable_hbm() {
    system("echo 1 > /sys/class/meizu/lcm/display/hbm");
    printf("🥳🥳🥳MEIZU INSCREEN IS WORKED🥳🥳🥳\n");
    system("log -t MEIZU-FOD \"🥳🥳🥳MEIZU INSCREEN IS WORKED🥳🥳🥳\"");
    sleep(1);
    system("echo 0 > /sys/class/meizu/lcm/display/hbm");
}

void* listen_syna_fpspi(void* arg) {
    FILE* logcat = popen("logcat -v brief | grep --line-buffered fpspi_qos_enable", "r");
    if (!logcat) {
        perror("popen failed (fpspi_qos_enable)");
        return NULL;
    }

    char line[1024];
    while (fgets(line, sizeof(line), logcat)) {
        show_dim_overlay();
        enable_hbm();
    }

    pclose(logcat);
    return NULL;
}

void* listen_goodix_fp(void* arg) {
    FILE* logcat = popen("logcat -v brief | grep --line-buffered testGoodixStart", "r");
    if (!logcat) {
        perror("popen failed (testGoodixStart)");
        return NULL;
    }

    char line[1024];
    while (fgets(line, sizeof(line), logcat)) {
        show_dim_overlay();
        enable_hbm();
    }

    pclose(logcat);
    return NULL;
}

int main() {
    pthread_t t1, t2;

    pthread_create(&t1, NULL, listen_syna_fpspi, NULL);
    pthread_create(&t2, NULL, listen_goodix_fp, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    return 0;
}