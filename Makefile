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

jkill:
	@echo "Killing processes on port 8080..."
	@lsof -ti:8080 | xargs kill -9 2>/dev/null || true
	@echo "Done!"

brbc:
	@echo "Running build runner..."
	@MAKE brc
	@MAKE brb
	make format
	@echo "Done!"

brb:
	@echo "Running build runner..."
	dart run build_runner build
	make format
	@echo "Done!"

brw:
	@echo "Watching build runner..."
	dart run build_runner watch
	@echo "Done!"

brwc:
	@echo "Watching build runner..."
	@MAKE brc
	@MAKE brw
	@echo "Done!"

brc:
	@echo "Running build runner clean..."
	dart run build_runner clean
	@echo "Done!"

format:
	@echo "Formatting code..."
	dart format .
	dart fix --apply
	@echo "Done!"