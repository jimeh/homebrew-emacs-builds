TAP = jimeh/emacs-builds

.DEFAULT: update

update: casks cask-shields

#
# Cask Meta
#

CASKS = $(notdir $(shell \
	brew tap-info --json "$(TAP)" | jq -r '.[0].cask_tokens[]' | sort \
))

CASK_META_FILES = $(foreach c,$(CASKS),Casks/$(c)/meta.json)

casks: $(CASK_META_FILES)

.PHONY: $(CASK_META_FILES)
$(CASK_META_FILES): Casks/%/meta.json:
	mkdir -p "$(dir $@)"
	brew info --cask --json=v2 "$(TAP)/$*" | jq '.casks[0]' > "$@"

#
# Shields Meta (for shields.io)
#

CASK_SHIELDS = $(foreach c,$(CASKS),$(if \
	$(shell test -f "templates/Casks/$(c)/shield.json.tpl" && echo ok),$(c),\
))
CASK_SHIELD_FILES = $(foreach c,$(CASK_SHIELDS),Casks/$(c)/shield.json)

cask-shields: $(CASK_SHIELD_FILES)

.PHONY: $(CASK_SHIELD_FILES)
$(CASK_SHIELD_FILES): Casks/%/shield.json:
	mkdir -p "$(dir $@)"
	brew info --cask --json=v2 "$(TAP)/$*" | \
		jq ".casks[0] | $$(cat "templates/Casks/$*/shield.json.tpl")" > "$@"
