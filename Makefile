info:
	echo "make reset           - flutter clean ; flutter pub get"
	echo "make update_pubspec  - update pubspec.yaml"
	echo "make update_phony    - update .PHONY in Makefile"

.SILENT:

.PHONY: info reset update_pubspec update_phony

reset:
	flutter clean ; flutter pub get

update_pubspec:
	scripts/update_pubspec

update_phony:
	scripts/update_phony
