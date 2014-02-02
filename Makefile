DATA_DIR=data
FILE_LIST=file_list.csv
FILE_LIST_RANDOM_A=file_list_a.csv
FILE_LIST_RANDOM_B=file_list_b.csv
TEX_FILE=guesswho.tex

.PHNOY:build_cheat
build_cheat: $(FILE_LIST)
	sort -R $(FILE_LIST) > $(FILE_LIST_RANDOM_A)
	sort -R $(FILE_LIST) > $(FILE_LIST_RANDOM_B)
	pdflatex $(TEX_FILE)



.PHONY:$(FILE_LIST)
$(FILE_LIST):
	test $$(ls -l $(DATA_DIR)/*.png | wc -l) -eq 24 || (echo 'You need 24 files !!'; false)
	-rm $(FILE_LIST)
	for fname in $(DATA_DIR)/*.png ;\
	       do \
	       echo $$fname";""$$(basename "$${fname%.png}")" >> $(FILE_LIST); \
	       done

