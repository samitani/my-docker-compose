SOURCES = $(wildcard *.Dockerfile)
TARGETS = $(notdir $(basename $(SOURCES)))


define MAKEALL
$(1): $1.Dockerfile
	docker build --network host -t $(1) -f $(1).Dockerfile .
endef

.PHONY:build
build: $(TARGETS)
$(foreach var,$(TARGETS),$(eval $(call MAKEALL,$(var))))

.PHONY:run
run:
	docker-compose up -d
	sleep 3
	docker ps | grep -v NAMES | awk '{ print $$NF }' | grep rpm | xargs -I '{}' docker exec '{}' systemctl start mysqld
	docker ps | grep -v NAMES | awk '{ print $$NF }' | grep rpm | xargs -I '{}' docker exec '{}' systemctl status mysqld
