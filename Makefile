VERSION=`cat version`

help: ## Show this help
	@echo "Makefile directives:\n"
	@grep '\#\#' Makefile | sed -e 's/\#\#/->/g'
	@echo ""

build: freeze ## Builds the packages
	equivs-build shaggyz-base
	equivs-build shaggyz-development
	equivs-build shaggyz-pentesting

freeze: ## Render the configuration files with the current version
	@echo "Applying version $(VERSION)... "
	@sed -e s/^Version:.*/"Version: ${VERSION}"/g shaggyz-base
	@sed -e s/^Version:.*/"Version: ${VERSION}"/g shaggyz-development
	@sed -e s/^Version:.*/"Version: ${VERSION}"/g shaggyz-pentesting
	@echo "Done"

provisioning: ## Installs the needed tools to create the packages in your system
	sudo apt install equivs

release: ## Releases a new version to github
	@echo "TBD"

clear: ## Removes all the DEB packages
	rm -f *.deb
