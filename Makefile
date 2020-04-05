MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

latex_data_dir := data/latex
latex_data_files := $(wildcard $(latex_data_dir)/*)
latex_targets := latex.el latex.cin latex.txt latex.ahk latex.stats.txt latex.inputplugin

latex.txt: $(latex_data_files)
	./generate.rb --name LaTeX --ibus-file=$@ $^

latex.ahk: $(latex_data_files)
	./generate.rb --name LaTeX --autohotkey-file=$@ $^

latex.stats.txt: $(latex_data_files)
	./generate.rb --stats-file=$@ $^

targets := $(latex_targets)

.PHONY: all
all: $(targets)

.PHONY: clean
clean:
	rm $(targets)
