%*******************************************************************************************************%
% File:              generate_direction_ratio1.m                                              
% Author:            Hexiang                                     | Boris Jeremic,                       %
% Date:              2017-02-04 21:01:44                         | University of California, Davis,95616%
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
function [direction_vector] = generate_direction_ratio1(central_point_inside,central_point_outside)
% function used to judge whether certain node is contact node
no_rows=size(central_point_inside,1);
    if(no_rows==1)
    	direction_vector(1)=central_point_outside(1,1)-central_point_inside(1,1);
    	direction_vector(2)=central_point_outside(1,2)-central_point_inside(1,2);
    	direction_vector(3)=central_point_outside(1,3)-central_point_inside(1,3);
    end
    if(no_rows==2)
    	direction_vector(1)=central_point_outside(1,1)-central_point_inside(1,1);
		direction_vector(2)=central_point_outside(1,2)-central_point_inside(1,2);
    	direction_vector(3)=central_point_outside(1,3)-central_point_inside(1,3);
    	test_vector(1)=central_point_inside(1,1)-central_point_inside(2,1);
    	test_vector(2)=central_point_inside(1,2)-central_point_inside(2,2);
    	test_vector(3)=central_point_inside(1,3)-central_point_inside(2,3);
    	if((test_vector(1)*direction_vector(1)+test_vector(2)*direction_vector(2)+test_vector(3)*direction_vector(3))~=0)
    		direction_vector(1)=central_point_outside(2,1)-central_point_inside(1,1);
			direction_vector(2)=central_point_outside(2,2)-central_point_inside(1,2);
    		direction_vector(3)=central_point_outside(2,3)-central_point_inside(1,3);
    	end
    end
    if(no_rows==3)
        direction_vector(1)=central_point_outside(1,1)+central_point_outside(2,1)+central_point_outside(3,1)-central_point_inside(1,1)-central_point_inside(2,1)-central_point_inside(3,1);
    	direction_vector(2)=central_point_outside(1,2)+central_point_outside(2,2)+central_point_outside(3,2)-central_point_inside(1,2)-central_point_inside(2,2)-central_point_inside(3,2);
    	direction_vector(3)=central_point_outside(1,3)+central_point_outside(2,3)+central_point_outside(3,3)-central_point_inside(1,3)-central_point_inside(2,3)-central_point_inside(3,3);
    end
    if(no_rows==4)
    	direction_vector(1)=central_point_outside(1,1)+central_point_outside(2,1)+central_point_outside(3,1)+central_point_outside(4,1)-central_point_inside(1,1)-central_point_inside(2,1)-central_point_inside(3,1)-central_point_inside(4,1);
    	direction_vector(2)=central_point_outside(1,2)+central_point_outside(2,2)+central_point_outside(3,2)+central_point_outside(4,2)-central_point_inside(1,2)-central_point_inside(2,2)-central_point_inside(3,2)-central_point_inside(4,2);
    	direction_vector(3)=central_point_outside(1,3)+central_point_outside(2,3)+central_point_outside(3,3)+central_point_outside(4,3)-central_point_inside(1,3)-central_point_inside(2,3)-central_point_inside(3,3)-central_point_inside(4,3);
    end
     if(no_rows==5)
    	direction_vector(1)=central_point_outside(1,1)+central_point_outside(2,1)+central_point_outside(3,1)+central_point_outside(4,1)+central_point_outside(5,1)-central_point_inside(1,1)-central_point_inside(2,1)-central_point_inside(3,1)-central_point_inside(4,1)-central_point_inside(5,1);
    	direction_vector(2)=central_point_outside(1,2)+central_point_outside(2,2)+central_point_outside(3,2)+central_point_outside(4,2)+central_point_outside(5,2)-central_point_inside(1,2)-central_point_inside(2,2)-central_point_inside(3,2)-central_point_inside(4,2)-central_point_inside(5,2);
    	direction_vector(3)=central_point_outside(1,3)+central_point_outside(2,3)+central_point_outside(3,3)+central_point_outside(4,3)+central_point_outside(5,3)-central_point_inside(1,3)-central_point_inside(2,3)-central_point_inside(3,3)-central_point_inside(4,3)-central_point_inside(5,3);
     end  
end
