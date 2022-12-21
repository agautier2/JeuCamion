// set up the hardware
#include "BasysMX3setup.h"

#include <xc.h>
#include <stdio.h>

// the RTOS is configured with a 1ms tick length
#include "RTOS/FreeRTOS.h"
#include "RTOS/task.h"
#include "RTOS/queue.h"
#include "RTOS/timers.h"
#include "RTOS/semphr.h"
#include "RTOS/ConfigPerformance.h"

// Basys libaries used
#include <sys/attribs.h>
#include "BasysLib/config.h"
#include "BasysLib/led.h"
#include "BasysLib/btn.h"
#include "BasysLib/swt.h"
#include "BasysLib/uart.h"

#include "game.h"
#include "math.h"

static unsigned int seed;
static uint8_t nb_trucks;
static uint8_t width;
static uint8_t height;
static uint8_t cristals[MAX_HEIGHT * MAX_WIDTH];

typedef enum
{
    MOVE,
    DIG
} move_t;

typedef struct
{
    uint8_t thread_id;
    uint16_t turn;
    move_t move;
    uint8_t truck_id;
    uint8_t x;
    uint8_t y;
} process_param_t;

static void SetupHardware(void);

void function(void *params)
{
    char commands[20];

    char *moves[2] = {"MOVE", "DIG"};
    process_param_t *ptr = params;
    int8_t sign = 1;
    while (1)
    {

        if (cristals[ptr->x + ptr->y * width])
        {
            ptr->move = 1;
            cristals[ptr->x + ptr->y * width]--;
        }
        else
        {
            ptr->move = 0;
            if (ptr->x >= width - 1 && sign == 1)
            {
                ptr->y++;
                ptr->x++;
                sign = -1;
            }
            else if (ptr->x == 0 && sign == -1)
            {
                ptr->x--;
                ptr->y++;
                sign = 1;
            }
            ptr->x += sign;
        }
        sprintf(commands, "%d %s %d %d %d", ptr->turn, moves[ptr->move], ptr->truck_id, ptr->x, ptr->y);
        puts(commands);
        ptr->turn++;
        if (ptr->y > height - 1)
        {
            break;
        }
    }
}

void function2(void *params)
{
    char commands[20];

    char *moves[2] = {"MOVE", "DIG"};
    process_param_t *ptr = params;
    uint8_t min_distance = 255;
    uint8_t x;
    uint8_t y;
    uint8_t d;
    uint8_t coordonnee_x_la_plus_proche = 0;
    uint8_t coordonnee_y_la_plus_proche = 0;
    uint8_t hauteur;
    uint8_t largeur;

    while (1)
    {
        min_distance = MAX_HEIGHT + MAX_WIDTH;
        for (hauteur = 0; hauteur < height; hauteur++)
        {
            for (largeur = 0; largeur < width; largeur++)
            {
                if (cristals[largeur + hauteur * width])
                {
                    x = abs(largeur - ptr->x);
                    y = abs(hauteur - ptr->y);
                    d = x + y;

                    if (d < min_distance)
                    {
                        min_distance = d;
                        coordonnee_x_la_plus_proche = largeur;
                        coordonnee_y_la_plus_proche = hauteur;
                    }
                }
            }
        }
        if (min_distance == MAX_HEIGHT + MAX_WIDTH)
        {
            break;
        }

        if (ptr->x > coordonnee_x_la_plus_proche)
        {
            ptr->move = 0;
            ptr->x -= 1;
        }
        else if (ptr->x < coordonnee_x_la_plus_proche)
        {
            ptr->move = 0;
            ptr->x += 1;
        }
        else if (ptr->y > coordonnee_y_la_plus_proche)
        {
            ptr->move = 0;
            ptr->y -= 1;
        }
        else if (ptr->y < coordonnee_y_la_plus_proche)
        {
            ptr->move = 0;
            ptr->y += 1;
        }
        else
        {
            ptr->move = 1;
        }

        if (ptr->move == 1)
        {
            cristals[ptr->x + ptr->y * width]--;
        }

        sprintf(commands, "%d %s %d %d %d", ptr->turn, moves[ptr->move], ptr->truck_id, ptr->x, ptr->y);
        puts(commands);
        ptr->turn++;
    }
}

/*
xQueueHandle queue;
xSemaphoreHandle semaphore;
 */

/* TODO UART */

int main(void)
{
    /* Prepare the hardware to run */
    SetupHardware();
    init_game(seed, &nb_trucks, &width, &height, cristals);

    process_param_t params[2] = {
        {.thread_id = 1, .turn = 0, .move = MOVE, .truck_id = 0, .x = 0, .y = 0},
        {.thread_id = 2, .turn = 0, .move = MOVE, .truck_id = 1, .x = 0, .y = 1}};

    /*xTaskCreate(function,
            "thread_premier_camion",
            configMINIMAL_STACK_SIZE,
            &params[0], /* parameters of function
            1, /* priority
            NULL); /* to not get the task handle*/

    xTaskCreate(function2,
                "thread_deuxième_camion",
                configMINIMAL_STACK_SIZE,
                &params[1], /* parameters of function */
                2,          /* priority */
                NULL);

    // queue = xQueueCreate(20, 2); // 2 bytes in each queue slot (a short integer)
    /*vSemaphoreCreateBinary(semaphore); // mutex
    vTaskDelay(20);
     */

    macro_enable_interrupts(); //    enable interrupts at CPU

    /* start the tasks and timer running */
    vTaskStartScheduler();

    while (1)
        ;
    return 0;
}

static void SetupHardware(void)
{
    // hardware setup from freeRTOS
    /* Configure the hardware for maximum performance. */
    // vHardwareConfigurePerformance();  // not called - conflicts with BasysLib LCD library
    /* Setup to use the external interrupt controller. */
    vHardwareUseMultiVectoredInterrupts();
    portDISABLE_INTERRUPTS();

    UART_Init(115200);

    // hardware setup for BASYS MX3
    // Set ports for onboard LEDs to outputs
    DDPCONbits.JTAGEN = 0; // allow access to all of PortA

    // Initialize used items from Basys Library
    LED_Init();
    SWT_Init();
    BTN_Init();

    // set pins as digital outputs for the SSD
    // these defines are created in the Digilent library  config.h
    tris_SSD_CA = 0;
    tris_SSD_CB = 0;
    tris_SSD_CC = 0;
    tris_SSD_CD = 0;
    tris_SSD_CE = 0;
    tris_SSD_CF = 0;
    tris_SSD_CG = 0;
    tris_SSD_DP = 0;

    tris_SSD_AN0 = 0;
    tris_SSD_AN1 = 0;
    tris_SSD_AN2 = 0;
    tris_SSD_AN3 = 0;

    // disable analog (set pins as digital))
    ansel_SSD_AN0 = 0;
    ansel_SSD_AN1 = 0;
}

/*-----------------------------------------------------------
 *  Hooks for RTOS.  Are not required to modify these
 *  May want to turn on LED or some other external signal if an error
 *  occurs
 *-----------------------------------------------------------*/

void vApplicationMallocFailedHook(void)
{
    /* vApplicationMallocFailedHook() will only be called if
    configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
    function that will get called if a call to pvPortMalloc() fails.
    pvPortMalloc() is called internally by the kernel whenever a task, queue,
    timer or semaphore is created.  It is also called by various parts of the
    demo application.  If heap_1.c or heap_2.c are used, then the size of the
    heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
    FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
    to query the size of free heap space that remains (although it does not
    provide information on how the remaining heap might be fragmented). */
    taskDISABLE_INTERRUPTS();
    for (;;)
        ;
}

/*-----------------------------------------------------------*/

void vApplicationIdleHook(void)
{
    /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
    to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
    task.  It is essential that code added to this hook function never attempts
    to block in any way (for example, call xQueueReceive() with a block time
    specified, or call vTaskDelay()).  If the application makes use of the
    vTaskDelete() API function (as this demo application does) then it is also
    important that vApplicationIdleHook() is permitted to return to its calling
    function, because it is the responsibility of the idle task to clean up
    memory allocated by the kernel to any task that has since been deleted. */
}

/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName)
{
    (void)pcTaskName;
    (void)pxTask;

    /* Run time task stack overflow checking is performed if
    configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook	function is
    called if a task stack overflow is detected.  Note the system/interrupt
    stack is not checked. */
    taskDISABLE_INTERRUPTS();
    for (;;)
        ;
}

/*-----------------------------------------------------------*/

void vApplicationTickHook(void)
{
    /* This function will be called by each tick interrupt if
    configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
    added here, but the tick hook is called from an interrupt context, so
    code must not attempt to block, and only the interrupt safe FreeRTOS API
    functions can be used (those that end in FromISR()). */
}

/*-----------------------------------------------------------*/

void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus)
{
    /* This overrides the definition provided by the kernel.  Other exceptions
    should be handled here. */
    for (;;)
        ;
}

/*-----------------------------------------------------------*/

void vAssertCalled(const char *pcFile, unsigned long ulLine)
{
    volatile unsigned long ul = 0;

    (void)pcFile;
    (void)ulLine;

    __asm volatile("di");
    {
        /* Set ul to a non-zero value using the debugger to step out of this
        function. */
        while (ul == 0)
        {
            portNOP();
        }
    }
    __asm volatile("ei");
}
