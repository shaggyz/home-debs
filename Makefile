help: ## Show this help
	@echo "Makefile directives:\n"
	@grep '\#\#' Makefile | sed -e 's/\#\#/->/g'
	@echo ""

build: ## Builds the packages
	equivs-build shaggyz-base
	equivs-build shaggyz-development
	equivs-build shaggyz-pentesting

provisioning: ## Installs the needed tools to create the packages in your system
	sudo apt install equivs

release: ## Releases a new version to github
	@echo "TBD"

clear: ## Removes all the DEB packages
	rm -f *.deb
