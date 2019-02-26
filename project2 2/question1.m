listings = {'user001_1.gif';'user002_1.gif';'user003_1.gif';'user004_1.gif';'user005_1.gif';'user006_1.gif';'user007_1.gif';'user008_1.gif';'user009_1.gif';'user010_1.gif'};


for i = 1:10
    image = imread(char(listings(i)));
    ImageOrientation(image);
end

