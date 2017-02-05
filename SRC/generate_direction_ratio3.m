%*******************************************************************************************************%
% File:              generate_direction_ratio3.m                                              
% Author:            Hexiang                                     | Boris Jeremic,                       %
% Date:              2017-02-04 20:59:56                         | University of California, Davis,95616%
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
function [direction_vector] = generate_direction_ratio3(central_point_inside,central_point_outside)
	no_rows=size(central_point_inside,1);
	if(no_rows==1)
		possible_direction(1,1)=central_point_outside(1,1)-central_point_inside(1,1);
		possible_direction(1,2)=central_point_outside(1,2)-central_point_inside(1,2);
		possible_direction(1,3)=central_point_outside(1,3)-central_point_inside(1,3);
		possible_direction(2,1)=central_point_outside(2,1)-central_point_inside(1,1);
		possible_direction(2,2)=central_point_outside(2,2)-central_point_inside(1,2);
		possible_direction(2,3)=central_point_outside(2,3)-central_point_inside(1,3);
		possible_direction(3,1)=central_point_outside(3,1)-central_point_inside(1,1);
		possible_direction(3,2)=central_point_outside(3,2)-central_point_inside(1,2);
		possible_direction(3,3)=central_point_outside(3,3)-central_point_inside(1,3);
		if((possible_direction(1,1)*possible_direction(2,1)+possible_direction(1,2)*possible_direction(2,2)+possible_direction(1,3)*possible_direction(2,3))==0)
			direction_vector(1,1)=possible_direction(1,1);
			direction_vector(1,2)=possible_direction(1,2);
			direction_vector(1,3)=possible_direction(1,3);
			direction_vector(2,1)=possible_direction(2,1);
			direction_vector(2,2)=possible_direction(2,2);
			direction_vector(2,3)=possible_direction(2,3);
		end
		if((possible_direction(1,1)*possible_direction(3,1)+possible_direction(1,2)*possible_direction(3,2)+possible_direction(1,3)*possible_direction(3,3))==0)
			direction_vector(1,1)=possible_direction(1,1);
			direction_vector(1,2)=possible_direction(1,2);
			direction_vector(1,3)=possible_direction(1,3);
			direction_vector(2,1)=possible_direction(3,1);
			direction_vector(2,2)=possible_direction(3,2);
			direction_vector(2,3)=possible_direction(3,3);
		end
		if((possible_direction(2,1)*possible_direction(3,1)+possible_direction(2,2)*possible_direction(3,2)+possible_direction(2,3)*possible_direction(3,3))==0)
			direction_vector(1,1)=possible_direction(2,1);
			direction_vector(1,2)=possible_direction(2,2);
			direction_vector(1,3)=possible_direction(2,3);
			direction_vector(2,1)=possible_direction(3,1);
			direction_vector(2,2)=possible_direction(3,2);
			direction_vector(2,3)=possible_direction(3,3);
		end
	end
	if(no_rows==2)
		test_vector(1)=central_point_inside(1,1)-central_point_inside(2,1);
		test_vector(2)=central_point_inside(1,2)-central_point_inside(2,2);
		test_vector(3)=central_point_inside(1,3)-central_point_inside(2,3);
		possible_direction(1,1)=central_point_outside(1,1)-central_point_inside(1,1);
		possible_direction(1,2)=central_point_outside(1,2)-central_point_inside(1,2);
		possible_direction(1,3)=central_point_outside(1,3)-central_point_inside(1,3);
		possible_direction(2,1)=central_point_outside(2,1)-central_point_inside(1,1);
		possible_direction(2,2)=central_point_outside(2,2)-central_point_inside(1,2);
		possible_direction(2,3)=central_point_outside(2,3)-central_point_inside(1,3);
		possible_direction(3,1)=central_point_outside(3,1)-central_point_inside(1,1);
		possible_direction(3,2)=central_point_outside(3,2)-central_point_inside(1,2);
		possible_direction(3,3)=central_point_outside(3,3)-central_point_inside(1,3);
		possible_direction(4,1)=central_point_outside(4,1)-central_point_inside(1,1);
		possible_direction(4,2)=central_point_outside(4,2)-central_point_inside(1,2);
		possible_direction(4,3)=central_point_outside(4,3)-central_point_inside(1,3);
		possible_direction(5,1)=central_point_outside(5,1)-central_point_inside(1,1);
		possible_direction(5,2)=central_point_outside(5,2)-central_point_inside(1,2);
		possible_direction(5,3)=central_point_outside(5,3)-central_point_inside(1,3);
		possible_direction(6,1)=central_point_outside(6,1)-central_point_inside(1,1);
		possible_direction(6,2)=central_point_outside(6,2)-central_point_inside(1,2);
		possible_direction(6,3)=central_point_outside(6,3)-central_point_inside(1,3);
		index_temp_direction=0;
		for i=1:6
			if(test_vector(1)*possible_direction(i,1)+test_vector(2)*possible_direction(i,2)+test_vector(3)*possible_direction(i,3)==0)
				index_temp_direction=index_temp_direction+1;
				temp_direction(index_temp_direction,1)=possible_direction(i,1);
				temp_direction(index_temp_direction,2)=possible_direction(i,2);
				temp_direction(index_temp_direction,3)=possible_direction(i,3);
			end
		end
		if(temp_direction(1,1)*temp_direction(2,1)+temp_direction(1,2)*temp_direction(2,2)+temp_direction(1,3)*temp_direction(2,3)==0)
			direction_vector(1,1)=temp_direction(1,1);
			direction_vector(1,2)=temp_direction(1,2);
			direction_vector(1,3)=temp_direction(1,3);
			direction_vector(2,1)=temp_direction(2,1);
			direction_vector(2,2)=temp_direction(2,2);
			direction_vector(2,3)=temp_direction(2,3);
		elseif(temp_direction(1,1)*temp_direction(3,1)+temp_direction(1,2)*temp_direction(3,2)+temp_direction(1,3)*temp_direction(3,3)==0)
			direction_vector(1,1)=temp_direction(1,1);
			direction_vector(1,2)=temp_direction(1,2);
			direction_vector(1,3)=temp_direction(1,3);
			direction_vector(2,1)=temp_direction(3,1);
			direction_vector(2,2)=temp_direction(3,2);
			direction_vector(2,3)=temp_direction(3,3);
			else
			direction_vector(1,1)=temp_direction(2,1);
			direction_vector(1,2)=temp_direction(2,2);
			direction_vector(1,3)=temp_direction(2,3);
			direction_vector(2,1)=temp_direction(3,1);
			direction_vector(2,2)=temp_direction(3,2);
			direction_vector(2,3)=temp_direction(3,3);	
		end
	end
end
