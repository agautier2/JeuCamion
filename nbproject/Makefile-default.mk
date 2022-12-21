#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Camion.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Camion.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=FreeRTOS.X/RTOS/ConfigPerformance.c FreeRTOS.X/RTOS/queue.c FreeRTOS.X/RTOS/port_asm.S FreeRTOS.X/RTOS/port.c FreeRTOS.X/RTOS/tasks.c FreeRTOS.X/RTOS/timers.c FreeRTOS.X/RTOS/croutine.c FreeRTOS.X/main.c FreeRTOS.X/game.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o ${OBJECTDIR}/FreeRTOS.X/main.o ${OBJECTDIR}/FreeRTOS.X/game.o
POSSIBLE_DEPFILES=${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o.d ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o.d ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o.d ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o.d ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o.d ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o.d ${OBJECTDIR}/FreeRTOS.X/main.o.d ${OBJECTDIR}/FreeRTOS.X/game.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o ${OBJECTDIR}/FreeRTOS.X/main.o ${OBJECTDIR}/FreeRTOS.X/game.o

# Source Files
SOURCEFILES=FreeRTOS.X/RTOS/ConfigPerformance.c FreeRTOS.X/RTOS/queue.c FreeRTOS.X/RTOS/port_asm.S FreeRTOS.X/RTOS/port.c FreeRTOS.X/RTOS/tasks.c FreeRTOS.X/RTOS/timers.c FreeRTOS.X/RTOS/croutine.c FreeRTOS.X/main.c FreeRTOS.X/game.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Camion.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX370F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o: FreeRTOS.X/RTOS/port_asm.S  .generated_files/flags/default/c4a8faddb6d8def43d097efd9983560b1585278e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.ok ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o FreeRTOS.X/RTOS/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d" "${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o: FreeRTOS.X/RTOS/port_asm.S  .generated_files/flags/default/fb7cf49ee41b2c5a8454ac077e3c3ec8a5a166b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.ok ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o FreeRTOS.X/RTOS/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.d" "${OBJECTDIR}/FreeRTOS.X/RTOS/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o: FreeRTOS.X/RTOS/ConfigPerformance.c  .generated_files/flags/default/491cc04de57b3dc9b155600dfc55939f1fcf9d3e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o FreeRTOS.X/RTOS/ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o: FreeRTOS.X/RTOS/queue.c  .generated_files/flags/default/78cf2da0d19baf9b3ae940de60a9f9aec9d47340 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o FreeRTOS.X/RTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/port.o: FreeRTOS.X/RTOS/port.c  .generated_files/flags/default/f482523d9080d1a9cf6373e4bf12a5dda6caf934 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/port.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o FreeRTOS.X/RTOS/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o: FreeRTOS.X/RTOS/tasks.c  .generated_files/flags/default/ccee5ddec3e19fd52d78e2ba7b799ebe8fa917c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o FreeRTOS.X/RTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o: FreeRTOS.X/RTOS/timers.c  .generated_files/flags/default/71a6fd94d6eb0c5f5631a2388b010f0b29945b17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o FreeRTOS.X/RTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o: FreeRTOS.X/RTOS/croutine.c  .generated_files/flags/default/a6550aaa3daf3cf0ee772abd642d29daa17a212 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o FreeRTOS.X/RTOS/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/main.o: FreeRTOS.X/main.c  .generated_files/flags/default/f046de354bd80b5e87fa196404607b6a174cc658 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/main.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/main.o.d" -o ${OBJECTDIR}/FreeRTOS.X/main.o FreeRTOS.X/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/game.o: FreeRTOS.X/game.c  .generated_files/flags/default/1410fe5fee4bd4855eb783742fb5222b23a48d65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/game.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/game.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/game.o.d" -o ${OBJECTDIR}/FreeRTOS.X/game.o FreeRTOS.X/game.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o: FreeRTOS.X/RTOS/ConfigPerformance.c  .generated_files/flags/default/1938601155e07c73f021f5c23187772b3edc610e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/ConfigPerformance.o FreeRTOS.X/RTOS/ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o: FreeRTOS.X/RTOS/queue.c  .generated_files/flags/default/f0b7b65e9c0f56fc6f571cbf29d442c5b706f1c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/queue.o FreeRTOS.X/RTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/port.o: FreeRTOS.X/RTOS/port.c  .generated_files/flags/default/40a66bf0e5736c81d38be284dce33c93e84e5bd3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/port.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/port.o FreeRTOS.X/RTOS/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o: FreeRTOS.X/RTOS/tasks.c  .generated_files/flags/default/b8f9a6d0350df56353edcbdada3a1c19d1561a97 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/tasks.o FreeRTOS.X/RTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o: FreeRTOS.X/RTOS/timers.c  .generated_files/flags/default/bbfd7e1a7cbf2a4a854aa0c353691ed3a22c4cc9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/timers.o FreeRTOS.X/RTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o: FreeRTOS.X/RTOS/croutine.c  .generated_files/flags/default/f41d4be3b6702414c2cc059235349813e1889d08 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X/RTOS" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o.d" -o ${OBJECTDIR}/FreeRTOS.X/RTOS/croutine.o FreeRTOS.X/RTOS/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/main.o: FreeRTOS.X/main.c  .generated_files/flags/default/433ecbb2f1b10f8d882005492660a33352144ea2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/main.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/main.o.d" -o ${OBJECTDIR}/FreeRTOS.X/main.o FreeRTOS.X/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS.X/game.o: FreeRTOS.X/game.c  .generated_files/flags/default/bbe2e42fdf2ddf673eb689ccbb4f260e9794c7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS.X" 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/game.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS.X/game.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FreeRTOS.X/game.o.d" -o ${OBJECTDIR}/FreeRTOS.X/game.o FreeRTOS.X/game.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Camion.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Camion.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Camion.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Camion.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Camion.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
