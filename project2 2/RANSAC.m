function [values] = RANSAC( f1, f2 )

arrayM = load(f1);
arrayN = load(f2);
 
lenM  = length(arrayM);
lenN  = length(arrayN);
prime = arrayM;
size = lenM * lenN;
array = zeros(size,0);
position = 1;
 
for i = 1:lenM
    for j = 1:lenN
        Px = arrayM(i,1);%xj
        Py = arrayM(i,2);%yj
        Pt = arrayM(i,3);%thetaj
        
        Qx = arrayN(j,1);%xi
        Qy = arrayN(j,2);%yi
        Qt = arrayN(j,3);%thetai
        
        deltaX = Qx - Px;
        deltaY = Qy - Py;
        THETA = Qt - Pt;
        Theta = deg2rad(THETA);
        
        for k = 1:lenM
            prime(k,1) = (arrayM(k,1)-Px)*cos(Theta) +(arrayM(k,2)-Py)*sin(Theta)+Px+deltaX;
            prime(k,2) = -(arrayM(k,1)-Px)*sin(Theta) +(arrayM(k,2)-Py)*cos(Theta)+Py+deltaY;
        end
        
        % total count 
        number_pairs = 0;
        
        array(position,1) = deltaX;
        array(position,2) = deltaY;
        array(position,3) = Theta;
        sizeprime = length(prime);
        
        for m =  1:lenN 
            % check when it is matching minutiae pairs
            tolerance = 10;
            onevalue = -4;
            distance = 0;
            index = 0;
             
            for n = 1:sizeprime
                x1 = arrayN(m,1);
                x2 = prime(n,1);
                y1 = arrayN(m,2);
                y2 = prime(n,2);
                
                distance = sqrt((x2 - x1)^2 + (y2 - y1)^2);
                %if it is true, it is matching minutiae pairs 
                if distance < tolerance 
                    
                   onevalue = distance;
                   index = n; 
                end           
            end
            array(position,4) = distance;
            
            %when distance changed, it is matching minutiae pairs
            if onevalue ~= -4
                prime(index,:) = [];
                sizeprime = sizeprime - 1;
                %number of pairs add 1
                number_pairs = number_pairs + 1;
            end
            
            array(position,5) = number_pairs;
            
        end
        position = position + 1;
     
    end
end
%sort the matrix
arraySort = sortrows(array,5);
 
tx = arraySort(size,1);
ty = arraySort(size,2);
theta = arraySort(size,3);
count = arraySort(size,5);

values = {f1, f2, tx, ty, theta, count};
 
end
