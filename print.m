function print(q)

fileID = fopen('Thanki_Dhruv.txt','w');
for i=1:3001
fprintf(fileID,'%.4f %.4f %.4f %.4f %.4f %.4f %.4f\n',q(i,1),q(i,2),q(i,3),q(i,4),q(i,5),q(i,6),q(i,7));
end
fclose(fileID);

end