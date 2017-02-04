function [ flag ] = write_add_contact_node(contact_node_coordinate,new_node)
%write input add contact fei file
flag=0;
	fileID = fopen('node.fei','w');
	formatSpec1='add node # %8.0d at ( %8.4f *m, %8.4f *m,%8.4f *m) with 3 dofs;\n';
	fprintf(fileID,formatSpec1,new_node'); 
	fprintf(fileID,'//Writing orinal nodes down. The following are newly generated contact nodes\n');
	formatSpec2='add node # %8.0d at ( %8.4f *m, %8.4f *m,%8.4f *m) with 3 dofs;\n';
	fprintf(fileID,formatSpec2,contact_node_coordinate');    %matlab is column-first.
	fclose(fileID);
flag=1;
end
