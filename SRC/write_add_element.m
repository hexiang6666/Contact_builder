%{/********************************************************************************************************
* File:              Matlab.tmpl                                              
* Author:            Hexiang                                     | Boris Jeremic,                       *
* Date:              2017-02-04 21:00:42                         | University of California, Davis,95616*
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

function [ flag ] = write_add_element(contact_element,No_elemnet,new_element)
%write input add contact fei file
flag=0;
index=[(No_elemnet+1):1:(size(contact_element,1)+No_elemnet)]';
	write_contact_element=[index contact_element];
	% fileID = fopen('add_contact_element.fei','w');
	fileID = fopen('element.fei','w');

	formatSpec1='add element #  %8.0d type 27NodeBrick with nodes(%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d) use material # %8.0d; \n';
	fprintf(fileID,formatSpec1,new_element');
	fprintf(fileID,'\n');
	fprintf(fileID,'//Writing original elements down. The following are conatct elements\n');
	fprintf(fileID,'\n');
	formatSpec2='add element #%8.0d type FrictionalPenaltyContact with nodes (%8.0d,%8.0d) normal_stiffness=kn tangential_stiffness=kt normal_damping=cn tangential_damping=ct friction_ratio=fr contact_plane_vector=(%8.4f,%8.4f,%8.4f);\n';
	
	fprintf(fileID,formatSpec2,write_contact_element');    %matlab is column-first.
	% fclose(fileID);

	% fileID2 = fopen('add_original_element.fei','w');
	% formatSpec='add element #  %8.0d type 27NodeBrick with nodes(%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d,%8.0d) use material # %8.0d; \n';
	% fprintf(fileID,formatSpec,new_element');
	fclose(fileID);

flag=1;
end
