ifneq (,$(findstring Windows,$(OS)))
    SEP := $(strip \)
else
    SEP := $(strip /)
endif

REBAR := .$(SEP)rebar

all: deps

deps:
	$(REBAR) get-deps
	$(REBAR) compile

app:
	$(REBAR) compile

tests:
	$(REBAR) eunit

clean:
	$(REBAR) clean

distclean: clean
	$(REBAR) delete-deps

.PHONY: all deps app tests clean distclean
