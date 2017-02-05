%{/********************************************************************************************************
* File:              Matlab.tmpl                                              
* Author:            Hexiang                                     | Boris Jeremic,                       *
* Date:              2017-02-04 20:59:06                         | University of California, Davis,95616*
* Description:       #############                               | California                           *
* Rev:               Version 1                                   | jeremic@ucdavis.edu                  *
* Email:             hexwang@ucdavis.edu                         | Computational Geomechanics Group     *
* * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  * 
*                           Last Modified time: 2017-02-04 20:58:34                                     *            
*  * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *         
* The copyright to the computer program(s) herein is the property of Hexiang Wang and Boris Jeremic     *
* The program(s) may be used and/or copied only with written permission of Hexiang Wang or in accordance* 
* with the terms and conditions stipulated in the agreement/contract under which the program have been  *
* supplied.                                                                                             *
*********************************************************************************************************/%}

function [ flag ] = write_add_contact_node(contact_node_coordinate,new_node)
%write input add contact fei file
flag=0;
	fileID = fopen('node.fei','w');
	formatSpec1='add node # %8.0d at ( %8.4f *m, %8.4f *m,%8.4f *m) with 3 dofs;\n';
	fprintf(fileID,formatSpec1,new_node'); 
	fprintf(fileID,'\n');
	fprintf(fileID,'//Writing orinal nodes down. The following are newly generated contact nodes\n');
	fprintf(fileID,'\n');
	formatSpec2='add node # %8.0d at ( %8.4f *m, %8.4f *m,%8.4f *m) with 3 dofs;\n';
	fprintf(fileID,formatSpec2,contact_node_coordinate');    %matlab is column-first.
	fclose(fileID);
flag=1;
end
