function ImageOrientation(Image )

Image = double(Image);
sobel_x_filter = [-1 -2 -1;0 0 0;1 2 1];
sobel_y_filter = [-1 0 1;-2 0 2;-1 0  1];

sobel_x = imfilter(Image,sobel_x_filter);
sobel_y = imfilter(Image,sobel_y_filter);
size_img = size(Image);
array = zeros(size_img);

for i = 1:(size_img(1,1)-9)%row
    for j = 1:(size_img(1,2)-9)%column
        sobelX = sobel_x(i:(i+8),j:(j+8));
        sobelY = sobel_y(i:(i+8),j:(j+8));
        array(i+4,j+4) = Orientation(sobelX,sobelY);
    end
end
drawOrientation(Image,array);
end