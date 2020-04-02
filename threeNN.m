function winner = threeNN(dataSet,testData)

    % Normalize and plot the data    
    norm1 = normalize(dataSet.d.data1);
    mean1 = mean(dataSet.d.data1);
    std1 = std(dataSet.d.data1);

    norm2 = normalize(dataSet.d.data2);
    mean2 = mean(dataSet.d.data2);
    std2 = std(dataSet.d.data2);

    norm3 = (testData(1) - mean1) / std1;
    norm4 = (testData(2) - mean2) / std2;

    A = strcmp(dataSet.d.label,dataSet.d.name1);
    B = strcmp(dataSet.d.label,dataSet.d.name2);

    normA = norm1(A);
    normC = norm2(A);
    normB = norm1(B); 
    normD = norm2(B);

    figure
    hold on
    plot(normA,normC,'o')
    plot(normB,normD,'x')
    plot(norm3,norm4,'k*','LineWidth',1.5)
    legend(dataSet.d.name1,dataSet.d.name2,'Test Data')
    hold off


    % Find the euclidian distance
    distance = sqrt((norm1 - norm3).^2 + (norm2 - norm4).^2)';


    % Find the three closest points
    [~,indices] = mink(distance,3);


    % Have the three closest points vote to determine the winner
    n = sum(A(indices));

    if(n > 1)
        winner = dataSet.d.name1;
    else
        winner = dataSet.d.name2;
    end

end