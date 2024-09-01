SOURCES = $(wildcard *.Dockerfile)
TARGETS = $(notdir $(basename $(SOURCES)))


define MAKEALL
$(1):
	docker build --network host -t $(1) -f $(1).Dockerfile .
endef

.PHONY:build
build: $(TARGETS)
$(foreach var,$(TARGETS),$(eval $(call MAKEALL,$(var))))
