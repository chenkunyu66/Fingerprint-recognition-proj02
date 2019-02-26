MinutiaArray = {'user001_1.minpoints','user001_2.minpoints','user002_1.minpoints','user002_2.minpoints','user003_1.minpoints','user003_2.minpoints','user004_1.minpoints','user004_2.minpoints','user005_1.minpoints','user005_2.minpoints'};
 
Table = {'File 1', 'File 2', 'tx', 'ty', 'theta', 'matching pairs'};
 
for i = 1:10
    for j = i+1: 10
        file1 = char(MinutiaArray(1,i));
        file2 = char(MinutiaArray(1,j));
        values = RANSAC(file1,file2);
        Table = [Table;values];     
    end
    j = j + 1;
end
disp('Results:');
disp(Table);
