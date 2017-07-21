OCB_FLAGS := -use-ocamlfind -plugin-tag "package(ppx_driver.ocamlbuild)"
OCB := ocamlbuild $(OCB_FLAGS)

.PHONY: test
test: tests.native
	./$< inline-test-runner test

.PRECIOUS: %.native
%.native: $(SRC)
	$(OCB) $@

.PHONY: clean
clean:
	$(OCB) -clean

.PHONY: working
working:
	docker build -f Dockerfile-working -t ppx_inline_test_issue-working .
	docker run --rm ppx_inline_test_issue-working

.PHONY: broken
broken:
	docker build -f Dockerfile-broken -t ppx_inline_test_issue-broken .
	docker run --rm ppx_inline_test_issue-broken
