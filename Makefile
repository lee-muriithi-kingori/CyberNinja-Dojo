.PHONY: install-hooks clean-hooks

install-hooks:
	@echo "Installing pre-commit hook..."
	@mkdir -p .git/hooks
	@cp tools/pre-commit .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
	@echo "Hook installed successfully!"
	@echo "The pre-commit hook will now run automatically on every commit."

clean-hooks:
	@echo "Removing pre-commit hook..."
	@rm -f .git/hooks/pre-commit
	@echo "Hook removed."
