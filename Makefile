#*******************************************************************************************************#
# File:              ShellScript.tmpl                                              
# Author:            Hexiang                                     | Boris Jeremic,                       #
# Date:              2017-02-04 21:16:59                         | University of California, Davis,95616#
# Description:       #############                               | California                           #
# Rev:               Version 1                                   | jeremic@ucdavis.edu                  #
# Email:             hexwang@ucdavis.edu                         | Computational Geomechanics Group     #
# * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  # 
#                           Last Modified time: 2017-02-04 21:16:54                                     #              
#  * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * #         
# The copyright to the computer program(s) herein is the property of Hexiang Wang and Boris Jeremic     #
# The program(s) may be used and/or copied only with written permission of Hexiang Wang or in accordance# 
# with the terms and conditions stipulated in the agreement/contract under which the program have been  #
# supplied.                                                                                             #
#*******************************************************************************************************#
CURRENT_DIR=$(realpath $(CURDIR))


all: build 

build: sed set_location generate  ##@Default Build contact element.

sed: $(FILE_DIR)/$(ELEMENT_NAME) $(FILE_DIR)/$(NODE_NAME)  
		@ if [ -d "$(FILE_DIR)/builder" ]; then rm -r $(FILE_DIR)/builder; fi
		@mkdir $(FILE_DIR)/builder
		@sed 's/[a-zA-Z#(),;]//g' $(FILE_DIR)/$(ELEMENT_NAME) >$(FILE_DIR)/builder/new_element.include
		@sed 's/[a-zA-Z#(),;*]//g' $(FILE_DIR)/$(NODE_NAME)  >$(FILE_DIR)/builder/new_node.include
		@echo "Processing input files...Successfully pre-process"
			
generate: $(FILE_DIR)/builder/new_element.include $(FILE_DIR)/builder/new_node.include $(CURRENT_DIR)/SRC/main.m
		@cp $(FILE_DIR)/builder/new_element.include $(CURRENT_DIR)/SRC
		@cp $(FILE_DIR)/builder/new_node.include $(CURRENT_DIR)/SRC
		@cd $(CURRENT_DIR)/SRC; echo "Launching matlab...Calculating..." ; matlab -r -nodisplay -nojvm main; 		
		@echo "Finish generating!"
		@echo ""
		@echo "███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗███████╗██╗"
		@echo "██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝██║"
		@echo "███████╗██║   ██║██║     ██║     █████╗  ███████╗███████╗██║"
		@echo "╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║╚════██║╚═╝"
		@echo "███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║███████║██╗"
		@echo "╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝╚═╝"
		@echo "                                                            "
		@mv $(CURRENT_DIR)/SRC/element.fei $(FILE_DIR)/builder/
		@mv $(CURRENT_DIR)/SRC/node.fei $(FILE_DIR)/builder/
		@rm $(FILE_DIR)/builder/new_element.include
		@rm $(FILE_DIR)/builder/new_node.include
		@rm $(CURRENT_DIR)/SRC/new_element.include
		@rm $(CURRENT_DIR)/SRC/new_node.include
		@mv $(CURRENT_DIR)/SRC/main_reserve.m $(CURRENT_DIR)/SRC/main.m

set_location: $(CURRENT_DIR)/SRC/set_coordinate 
		@cd $(CURRENT_DIR)/SRC
		@cp $(CURRENT_DIR)/SRC/main.m $(CURRENT_DIR)/SRC/main_reserve.m
		@$(CURRENT_DIR)/SRC/set_coordinate

install: Contact_builder  ##@Default install Contact_builder.
		@echo export INSTALL_DIR=$(PWD) | cat - Contact_builder > temp && mv temp Contact_builder
		@echo "#!/bin/bash" | cat - Contact_builder > temp && mv temp Contact_builder
		@sudo chmod +x $(realpath $(CURDIR))/Contact_builder
		@cp $(CURRENT_DIR)/Makefile $(CURRENT_DIR)/SRC/Makefile_reserve
		@sudo ln -sf $(realpath $(CURDIR))/Contact_builder /usr/local/bin
		@echo "Installing Contact_builder...Successfully installed"

clean: $(FILE_DIR)/builder   ##@Default delete running result.
		@rm -rf $(FILE_DIR)/builder
		@echo "Cleaning...Created files has been deleted"

remove: ##@Default uninstall Contact_builder.
		@rm -rf $(INSTALL_DIR)
		@sudo rm /usr/local/bin/Contact_builder
		@echo  "Contact_builder has been completely removed from your computer!"  

help: ##@Default Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)


HELP_FUN = \
	 %help; \
	 while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^(\w+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/ }; \
	 print "usage: make   [target]\n\n"; \
	 print "=======================================================================\n";\
	 for (keys %help) { \
	 print "$$_:\n"; $$sep = " " x (20 - length $$_->[0]); \
	 printf("  %-30s %s\n", $$_->[0], $$_->[1]) for @{$$help{$$_}}; \
	 print "\n"; };  