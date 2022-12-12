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

static void SetupHardware(void);

void function(void * params) {
    while(1)
    {
        UART_PutString("Un beau texte\r\n");
        putchar('V');
        puts("incent\r\n");
        vTaskDelay(1000);
    }
}

/*
xQueueHandle queue;
xSemaphoreHandle semaphore;
 */

/* TODO UART */

int main(void) {

    unsigned int seed = 4;
    uint8_t nb_trucks;
    uint8_t width;
    uint8_t height;
    uint8_t cristals[width][height];

    init_game(seed, &nb_trucks, &width, &height, &cristals);

    /* Prepare the hardware to run */
    SetupHardware();

    xTaskCreate(function,
            "Task name",
            configMINIMAL_STACK_SIZE,
            NULL, /* parameters of function */
            4, /* priority */
            NULL); /* to not get the task handle */

    /*
    queue = xQueueCreate(20, 2); // 2 bytes in each queue slot (a short integer)
    vSemaphoreCreateBinary(semaphore); // mutex
    vTaskDelay(20);
     */

    macro_enable_interrupts(); //    enable interrupts at CPU

    /* start the tasks and timer running */
    vTaskStartScheduler();

    while (1);
    return 0;
}

static void SetupHardware(void) {
    // hardware setup from freeRTOS
    /* Configure the hardware for maximum performance. */
    // vHardwareConfigurePerformance();  // not called - conflicts with BasysLib LCD library
    /* Setup to use the external interrupt controller. */
    vHardwareUseMultiVectoredInterrupts();
    portDISABLE_INTERRUPTS();


    // hardware setup for BASYS MX3
    //Set ports for onboard LEDs to outputs
    DDPCONbits.JTAGEN = 0; // allow access to all of PortA

    // Initialize used items from Basys Library
    LED_Init();
    SWT_Init();
    BTN_Init();
    UART_Init(115200);

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

void vApplicationMallocFailedHook(void) {
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
    for (;;);
}

/*-----------------------------------------------------------*/

void vApplicationIdleHook(void) {
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

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName) {
    (void) pcTaskName;
    (void) pxTask;

    /* Run time task stack overflow checking is performed if
    configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook	function is 
    called if a task stack overflow is detected.  Note the system/interrupt
    stack is not checked. */
    taskDISABLE_INTERRUPTS();
    for (;;);
}

/*-----------------------------------------------------------*/

void vApplicationTickHook(void) {
    /* This function will be called by each tick interrupt if
    configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
    added here, but the tick hook is called from an interrupt context, so
    code must not attempt to block, and only the interrupt safe FreeRTOS API
    functions can be used (those that end in FromISR()). */
}

/*-----------------------------------------------------------*/

void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
    /* This overrides the definition provided by the kernel.  Other exceptions 
    should be handled here. */
    for (;;);
}

/*-----------------------------------------------------------*/

void vAssertCalled(const char * pcFile, unsigned long ulLine) {
    volatile unsigned long ul = 0;

    (void) pcFile;
    (void) ulLine;

    __asm volatile( "di");
    {
        /* Set ul to a non-zero value using the debugger to step out of this
        function. */
        while (ul == 0) {
            portNOP();
        }
    }
    __asm volatile( "ei");
}
