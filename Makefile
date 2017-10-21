TOOL_CHAIN=GCC_ARM
TARGET=NUCLEO_F446RE
PROFILE_DIR=build_profile
PROFILE_JSON=release.json
PROFILE=$(PROFILE_DIR)/$(PROFILE_JSON)
FLASH=true

compile:
	@make info
	@if [ "$(FLASH)" == "true" ]; then \
 		 mbed compile -t $(TOOL_CHAIN) -m $(TARGET) --profile=$(PROFILE) -f && \
		 printf "Flashing binary success\n" || \
		 printf "Flashing binary fail\n"; \
	 else \
	 	 mbed compile -t $(TOOL_CHAIN) -m $(TARGET) --profile=$(PROFILE); \
	 fi;

clean:
	rm -rf BUILD

info:
	@printf "compile using\n"
	@printf "  TOOL_CHAIN: $(TOOL_CHAIN)\n"
	@printf "  TARGET: $(TARGET)\n"
	@printf "  PROFILE: $(PROFILE)\n"
	@printf "  FLASH: $(FLASH)\n"
