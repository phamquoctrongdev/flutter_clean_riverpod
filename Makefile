REQUIRED_VERSION := 3.29.1
USE_FVM ?= true

# ANSI color codes
COLOR_GREEN := \033[0;32m
COLOR_BLUE := \033[0;34m
COLOR_RED := \033[0;31m
COLOR_RESET := \033[0m

# Check FVM
IS_FVM := $(if $(filter true,$(strip $(USE_FVM))),true,false)

FLUTTER_CMD := $(if $(filter true,$(strip $(USE_FVM))),fvm flutter,flutter)
DART_CMD := $(if $(filter true,$(strip $(USE_FVM))),fvm dart,dart)


# Terminals
FLUTTER_CLEAN = $(FLUTTER_CMD) clean
FLUTTER_PUB_GET = $(FLUTTER_CMD) pub get
DART_BUILD_RUNNER = $(DART_CMD) run build_runner build -d
LOCALIZATION_GENERATE = $(DART_CMD) run easy_localization:generate -S assets/translations & $(DART_CMD) run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
FLUTTER_VERSION = $(FLUTTER_CMD) --version
FLUTTER_TEST = $(FLUTTER_CMD) test -r expanded
FLUTTER_TEST_COVERAGE = $(FLUTTER_CMD) test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html

# Retrieve the current Flutter version
get_flutter_version = $(shell $(FLUTTER_VERSION) | sed -n 's/Flutter \([0-9.]*\) .*/\1/p')

CURRENT_VERSION := $(call get_flutter_version)

# Version check
ifneq ($(CURRENT_VERSION), $(REQUIRED_VERSION))
  $(error $(COLOR_RED)Error: Flutter version $(REQUIRED_VERSION) is required. You are using version $(CURRENT_VERSION).$(COLOR_RESET))
endif

# Generate necessary files
all:
	@echo "Required version: $(REQUIRED_VERSION)$(COLOR_RESET)"
	@echo "Current version: $(CURRENT_VERSION)$(COLOR_RESET)"
	@echo "$(COLOR_GREEN)Starting the tasks...$(COLOR_RESET)"
	@$(MAKE) clean
	@$(MAKE) pub_get
	@$(MAKE) localization
	@$(MAKE) build_runner
	@echo "$(COLOR_GREEN)All tasks completed successfully! $(COLOR_RESET)"
clean:
	@echo "$(COLOR_BLUE)Running $(FLUTTER_CLEAN) ...$(COLOR_RESET)"
	@$(FLUTTER_CLEAN)
pub_get:
	@echo "$(COLOR_BLUE)Running $(FLUTTER_PUB_GET) ...$(COLOR_RESET)"
	@$(FLUTTER_PUB_GET)
localization:
	@echo "$(COLOR_BLUE)Running $(LOCALIZATION_GENERATE) ...$(COLOR_RESET)"
	@$(LOCALIZATION_GENERATE)
build_runner:
	@echo "$(COLOR_BLUE)Running $(DART_BUILD_RUNNER) ...$(COLOR_RESET)"
	@$(DART_BUILD_RUNNER)
unit_test:
	@echo "$(COLOR_BLUE)Running $(FLUTTER_TEST) ...$(COLOR_RESET)"
	@$(FLUTTER_TEST)
test_coverage:
	@echo "$(COLOR_BLUE)Running $(FLUTTER_TEST_COVERAGE) ...$(COLOR_RESET)"
	@$(FLUTTER_TEST_COVERAGE)

# Generate necessary files without `flutter clean`
without_clean:
	@echo "$(COLOR_GREEN)Generate necessary files without clean... $(COLOR_RESET)"
	@$(FLUTTER_PUB_GET)
	@$(DART_BUILD_RUNNER)
	@$(LOCALIZATION_GENERATE)
	@echo "$(COLOR_GREEN)Files generated successfully. $(COLOR_RESET)"

run_ci:
	@echo "$(COLOR_GREEN)🚀 Running '$(FLUTTER_TEST)'...$(COLOR_RESET)"
	$(FLUTTER_TEST)
	@echo "$(COLOR_GREEN)🚀 Running '$(FLUTTER_CMD) build apk --flavor dev --debug'...$(COLOR_RESET)"
	$(FLUTTER_CMD) build apk --flavor dev --debug
	@echo "$(COLOR_GREEN)🚀 Running '$(FLUTTER_CMD) build ios --no-codesign --flavor dev --debug'...$(COLOR_RESET)"
	$(FLUTTER_CMD) build ios --no-codesign --flavor dev --debug