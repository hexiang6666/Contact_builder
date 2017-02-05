%*******************************************************************************************************%
% File:              main.m                                              
% Author:            Hexiang                                     | Boris Jeremic,                       %
% Date:              2017-02-04 21:02:11                         | University of California, Davis,95616%
% Description:       #############                               | California                           %
% Rev:               Version 1                                   | jeremic@ucdavis.edu                  %
% Email:             hexwang@ucdavis.edu                         | Computational Geomechanics Group     %
% * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  %
%                           Last Modified time: 2017-02-04 20:58:34                                     %           
%  * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * %        
% The copyright to the computer program(s) herein is the property of Hexiang Wang and Boris Jeremic     %
% The program(s) may be used and/or copied only with written permission of Hexiang Wang or in accordance%
% with the terms and conditions stipulated in the agreement/contract under which the program have been  %
% supplied.                                                                                             %
%*******************************************************************************************************%
% ############################load input file############################
load new_element.include;
load new_node.include;
new_element(:,2)=[];
new_node(:,5)=[];
% ##################################define surface boundry ##############################
% // surface_boundary_coordinate_left_x =-15.0;
% // surface_boundary_coordinate_right_x =15.0;
% // surface_boundary_coordinate_up_z =0.0;
% // surface_boundary_coordinate_down_z=-36.0;
% // surface_boundary_coordinate_front_y=15;
% // surface_boundary_coordinate_back_y=-15;
%############################################
No_node=size(new_node,1);
No_elemnet=size(new_element,1);
contact_node_index=0;
for i=1:No_node
	if(((new_node(i,2)==surface_boundary_coordinate_left_x)&(new_node(i,3)<=surface_boundary_coordinate_front_y)&(new_node(i,3)>=surface_boundary_coordinate_back_y)&(new_node(i,4)>=surface_boundary_coordinate_down_z)&(new_node(i,4)<=surface_boundary_coordinate_up_z))|((new_node(i,2)==surface_boundary_coordinate_right_x)&(new_node(i,3)<=surface_boundary_coordinate_front_y)&(new_node(i,3)>=surface_boundary_coordinate_back_y)&(new_node(i,4)>=surface_boundary_coordinate_down_z)&(new_node(i,4)<=surface_boundary_coordinate_up_z))|((new_node(i,3)==surface_boundary_coordinate_front_y)&(new_node(i,2)<=surface_boundary_coordinate_right_x)&(new_node(i,2)>=surface_boundary_coordinate_left_x)&(new_node(i,4)>=surface_boundary_coordinate_down_z)&(new_node(i,4)<=surface_boundary_coordinate_up_z))|((new_node(i,3)==surface_boundary_coordinate_back_y)&(new_node(i,2)<=surface_boundary_coordinate_right_x)&(new_node(i,2)>=surface_boundary_coordinate_left_x)&(new_node(i,4)>=surface_boundary_coordinate_down_z)&(new_node(i,4)<=surface_boundary_coordinate_up_z))|((new_node(i,4)==surface_boundary_coordinate_down_z)&(new_node(i,2)<=surface_boundary_coordinate_right_x)&(new_node(i,2)>=surface_boundary_coordinate_left_x)&(new_node(i,3)>=surface_boundary_coordinate_back_y)&(new_node(i,3)<=surface_boundary_coordinate_front_y)))
    	contact_node_index=contact_node_index+1;
    	contact_node_temp(contact_node_index)=i;
	end
end
contact_node=contact_node_temp';
new_contact_node_index=No_node*2;
contact_element_index=0;
contact_node_coordinate=zeros(contact_node_index,4);
for j=1:contact_node_index  % j contact node No
% j=13;
	contact_node_coordinate(j,1)=new_contact_node_index+j;
	contact_node_coordinate(j,2)=new_node(contact_node(j,1),2);%contact_node_coordinate:information of the new point
	contact_node_coordinate(j,3)=new_node(contact_node(j,1),3);
	contact_node_coordinate(j,4)=new_node(contact_node(j,1),4);
	No_inside_element=0;
	No_outside_element=0;
	for k=1:No_elemnet     % k element No
		for m=1:27      % element component node
			if(new_element(k,m+1)==contact_node(j,1))
				if((new_node(new_element(k,22),2)<surface_boundary_coordinate_right_x)&(new_node(new_element(k,22),2)>surface_boundary_coordinate_left_x)&(new_node(new_element(k,22),3)>surface_boundary_coordinate_back_y)&(new_node(new_element(k,22),3)<surface_boundary_coordinate_front_y)&(new_node(new_element(k,22),4)>surface_boundary_coordinate_down_z)&(new_node(new_element(k,22),4)<surface_boundary_coordinate_up_z))
					No_inside_element=No_inside_element+1;
					central_point_inside(No_inside_element,1)=new_node(new_element(k,22),2);
					central_point_inside(No_inside_element,2)=new_node(new_element(k,22),3);
					central_point_inside(No_inside_element,3)=new_node(new_element(k,22),4);
				else
					No_outside_element=No_outside_element+1;
					central_point_outside(No_outside_element,1)=new_node(new_element(k,22),2);
					central_point_outside(No_outside_element,2)=new_node(new_element(k,22),3);
					central_point_outside(No_outside_element,3)=new_node(new_element(k,22),4);
					new_element(k,m+1)=contact_node_coordinate(j,1);
				end
			end
        end
    end 
  	element_ratio=No_inside_element/No_outside_element;%calculate the ratio of No_inside_element to No_outside_element share the contact node 
	if(element_ratio==1)         %contact nodes with one contact direction
		contact_element_index=contact_element_index+1;
		contact_element(contact_element_index,1)=contact_node(j,1);
		contact_element(contact_element_index,2)=contact_node_coordinate(j,1);
		direction_vector=generate_direction_ratio1(central_point_inside,central_point_outside);
        clear central_point_inside;
        clear central_point_outside;
		contact_element(contact_element_index,3)=direction_vector(1);
		contact_element(contact_element_index,4)=direction_vector(2);
		contact_element(contact_element_index,5)=direction_vector(3);
	end
	if(element_ratio==1/3)		%contact nodes with two contact directions
		contact_element_index=contact_element_index+1;
		contact_element(contact_element_index,1)=contact_node(j,1);
		contact_element(contact_element_index,2)=contact_node_coordinate(j,1);
		direction_vector=generate_direction_ratio3(central_point_inside,central_point_outside);
        clear central_point_inside;
        clear central_point_outside;
		contact_element(contact_element_index,3)=direction_vector(1,1);
		contact_element(contact_element_index,4)=direction_vector(1,2);
		contact_element(contact_element_index,5)=direction_vector(1,3);
		contact_element_index=contact_element_index+1;
		contact_element(contact_element_index,1)=contact_node(j);
		contact_element(contact_element_index,2)=contact_node_coordinate(j,1);
		contact_element(contact_element_index,3)=direction_vector(2,1);
		contact_element(contact_element_index,4)=direction_vector(2,2);
		contact_element(contact_element_index,5)=direction_vector(2,3);
	end
	if(element_ratio==1/7)   %contact nodes with three contact directions
		contact_element_index=contact_element_index+1;
		contact_element(contact_element_index,1)=contact_node(j,1);
		contact_element(contact_element_index,2)=contact_node_coordinate(j,1);
        direction_vector=generate_direction_ratio7(central_point_inside,central_point_outside);
        clear central_point_inside;
        clear central_point_outside;
		contact_element(contact_element_index,3)=direction_vector(1,1);
		contact_element(contact_element_index,4)=direction_vector(1,2);
		contact_element(contact_element_index,5)=direction_vector(1,3);
		contact_element_index=contact_element_index+1;
		contact_element(contact_element_index,1)=contact_node(j,1);
		contact_element(contact_element_index,2)=contact_node_coordinate(j,1);
		contact_element(contact_element_index,3)=direction_vector(2,1);
		contact_element(contact_element_index,4)=direction_vector(2,2);
		contact_element(contact_element_index,5)=direction_vector(2,3);
		contact_element_index=contact_element_index+1;
		contact_element(contact_element_index,1)=contact_node(j,1);
		contact_element(contact_element_index,2)=contact_node_coordinate(j,1);
		contact_element(contact_element_index,3)=direction_vector(3,1);
		contact_element(contact_element_index,4)=direction_vector(3,2);
		contact_element(contact_element_index,5)=direction_vector(3,3);
	end
 end

 write_add_element(contact_element,No_elemnet,new_element);
 write_add_contact_node(contact_node_coordinate,new_node);
 quit;

					
				

