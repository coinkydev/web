prune:
	@echo "Pruning..."
	git fetch -p
	git branch -vv | grep ': gone]' | awk '{print $$1}' | xargs -r git branch -D
	@echo "Done!"

tag-prune:
	@echo "Pruning git tags..."
	git fetch --prune origin --tags
	@bash -c 'comm -23 <(git tag | sort) <(git ls-remote --tags origin | awk "{print $$2}" | sed "s|refs/tags/||" | sort) | xargs -r git tag -d'
	@echo "Done!"

upgrade:
	@echo "Upgrading dependencies..."
	dart pub upgrade --major-versions --tighten
	@echo "Done!"

jbuild:
	@echo "Building..."
	jaspr build
	@echo "Done!"

jrun:
	@echo "Running..."
	jaspr serve
	@echo "Done!"


