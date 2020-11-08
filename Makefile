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
	@sed -i s/^Version:.*/"Version: ${VERSION}"/g shaggyz-base
	@sed -i s/^Version:.*/"Version: ${VERSION}"/g shaggyz-development
	@sed -i s/^Version:.*/"Version: ${VERSION}"/g shaggyz-pentesting
	@echo "Done"

provisioning: ## Installs the needed tools to create the packages in your system
	sudo apt install equivs

release: build ## Releases a new version to github
	git add .
	git commit
	git push 
	git tag $(VERSION)
	git push --tags

clear: ## Removes all the DEB packages
	rm -f *.deb
