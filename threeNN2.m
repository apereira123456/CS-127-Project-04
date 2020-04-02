function [winner,distance] = threeNN2(dataSet,testData)

norm1 = zeros(size(dataSet.d.data1));
norm2 = zeros(size(dataSet.d.data2));
norm3 = 0;
norm4 = 0;
A = zeros(size(dataSet.d.label));
distance = zeros(size(dataSet.d.label));
indices = zeros(3,1);

normData;
eucDistance;
closePoints;
vote;

    function normData
        
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
        plot(normA,normC,'o','LineStyle','none')
        plot(normB,normD,'x','LineStyle','none')
        plot(norm3,norm4,'k*','LineWidth',1.5,'LineStyle','none')
        legend(dataSet.d.name1,dataSet.d.name2,'Test Data')
        hold off
        
    end

    function eucDistance
        
        distance = sqrt((norm1 - norm3).^2 + (norm2 - norm4).^2)';
        
    end

    function closePoints
        
        [~,indices] = mink(distance,3);
        
    end

    function vote
        
        n = sum(A(indices));
        
        if(n > 1)
            winner = dataSet.d.name1;
        else
            winner = dataSet.d.name2;
        end
        
    end

end

