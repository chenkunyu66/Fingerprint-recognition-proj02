function drawOrientation(img, ofield, varargin)
%% Call this function as drawOrientation(img, ofield)
%% where 'img' is the image matrix and 'ofield' is the 
%% orientation field matrix. This function displays
%% 'ofield' as a set of quivers on image 'img'.
%%
%% Author: Arun Ross
%% Last Modified: 10 Oct 2006

if (nargin==2)
    blksz = 11;
else
    blksz = varargin{1};
end

hblksz = round(blksz/2);
r = hblksz;

[nr nc] = size(ofield);
u_ofield = r*cos(ofield);
v_ofield = r*sin(ofield);

[X, Y] = meshgrid(hblksz:blksz:nr-hblksz, hblksz:blksz:nc-hblksz);
X = X(:);
Y = Y(:);
for i=1:size(X)
    U(i) = u_ofield(X(i), Y(i));
    V(i) = v_ofield(X(i), Y(i));
end
figure; 
imshow(img,[]);
hold on;
h=quiver(Y, X, V', U');
set(h,'Color',[1 1 1]);