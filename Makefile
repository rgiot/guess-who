#    This file is part of Guess Who Sheet Builder.
#
#    Guess Who Sheet Builder is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Guess Who Sheet Builder is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Guess Who Sheet Builder.  If not, see <http://www.gnu.org/licenses/>.


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

