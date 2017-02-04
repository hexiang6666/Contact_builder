CURRENT_DIR=$(realpath $(CURDIR))


all: sed set_location generate 

sed: $(FILE_DIR)/$(ELEMENT_NAME) $(FILE_DIR)/$(NODE_NAME)
		@rm -rf $(FILE_DIR)/builder
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

install: Contact_builder
		@echo export INSTALL_DIR=$(PWD) | cat - Contact_builder > temp && mv temp Contact_builder
		@echo "#!/bin/bash" | cat - Contact_builder > temp && mv temp Contact_builder
		@sudo chmod +x $(realpath $(CURDIR))/Contact_builder
		@cp $(CURRENT_DIR)/Makefile $(CURRENT_DIR)/SRC/Makefile_reserve
		@sudo ln -sf $(realpath $(CURDIR))/Contact_builder /usr/local/bin
		@echo "Installing Contact_builder...Successfully installed"

clean: $(FILE_DIR)/builder
		@rm -r $(FILE_DIR)/builder

remove: $(CURRENT_DIR)
		@sudo rm -rf $(CURRENT_DIR)
		@sudo rm /usr/local/bin/Contact_builder
		@echo  "Contact_builder has been completely removed from your computer!"  