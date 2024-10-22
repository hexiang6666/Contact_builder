%*******************************************************************************************************%
% File:              generate_direction_ratio7.m                                              
% Author:            Hexiang                                     | Boris Jeremic,                       %
% Date:              2017-02-04 21:01:58                         | University of California, Davis,95616%
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

function [direction_vector] = generate_direction_ratio7(central_point_inside,central_point_outside)
	possible_vector(1,1)=central_point_outside(1,1)-central_point_inside(1,1);
	possible_vector(1,2)=central_point_outside(1,2)-central_point_inside(1,2);
	possible_vector(1,3)=central_point_outside(1,3)-central_point_inside(1,3);
	possible_vector(2,1)=central_point_outside(2,1)-central_point_inside(1,1);
	possible_vector(2,2)=central_point_outside(2,2)-central_point_inside(1,2);
	possible_vector(2,3)=central_point_outside(2,3)-central_point_inside(1,3);
	possible_vector(3,1)=central_point_outside(3,1)-central_point_inside(1,1);
	possible_vector(3,2)=central_point_outside(3,2)-central_point_inside(1,2);
	possible_vector(3,3)=central_point_outside(3,3)-central_point_inside(1,3);
	possible_vector(4,1)=central_point_outside(4,1)-central_point_inside(1,1);
	possible_vector(4,2)=central_point_outside(4,2)-central_point_inside(1,2);
	possible_vector(4,3)=central_point_outside(4,3)-central_point_inside(1,3);
	possible_vector(5,1)=central_point_outside(5,1)-central_point_inside(1,1);
	possible_vector(5,2)=central_point_outside(5,2)-central_point_inside(1,2);
	possible_vector(5,3)=central_point_outside(5,3)-central_point_inside(1,3);
	possible_vector(6,1)=central_point_outside(6,1)-central_point_inside(1,1);
	possible_vector(6,2)=central_point_outside(6,2)-central_point_inside(1,2);
	possible_vector(6,3)=central_point_outside(6,3)-central_point_inside(1,3);
	possible_vector(7,1)=central_point_outside(7,1)-central_point_inside(1,1);
	possible_vector(7,2)=central_point_outside(7,2)-central_point_inside(1,2);
	possible_vector(7,3)=central_point_outside(7,3)-central_point_inside(1,3);
	for i=1:7
		mag(i)=norm(possible_vector(i,:));
    end
    new_mag=sort(mag);
    direction_vector=zeros(3,3);
    for j=1:7
        
        if(mag(j)==new_mag(1))
			direction_vector(1,1)=possible_vector(j,1);
			direction_vector(1,2)=possible_vector(j,2);
			direction_vector(1,3)=possible_vector(j,3);
            new_mag(1)=-1;
            continue;
        end
        
        if(mag(j)==new_mag(2))
			direction_vector(2,1)=possible_vector(j,1);
			direction_vector(2,2)=possible_vector(j,2);
			direction_vector(2,3)=possible_vector(j,3);
            new_mag(2)=-2;
            continue;
        end
         if(mag(j)==new_mag(3))
			direction_vector(3,1)=possible_vector(j,1);
			direction_vector(3,2)=possible_vector(j,2);
			direction_vector(3,3)=possible_vector(j,3);
        end
	end

end