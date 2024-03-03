function h = pascal(x,pick_a_row)
%start with a k that is x-1
%this k gives an index for the tab for the pyramid shape
%(every time, k is smaller, less tabbing on the left side)
    k = x-1;
    %first row is 1
    num = 1;
    %tab (for making pyramid shape)
    fprintf('\t')
    
    for i = 1:1:x
        for j = 1:1:k
            
            %tab again
            fprintf('\t')
        end 
        for j = 1:1:i
            %variable that is 0, so we can print the 0s
            zeros_print = 0;
            %tab again
            fprintf('\t');
            %print current num, from 1:i
            fprintf('%d',num(j));
            %tab again
            fprintf('\t');
            %print a zero
            fprintf('%d',zeros_print)
        end
        k = k-1;
        %new line
        fprintf('\n')
        %tab
        fprintf('\t')
        %the numbers are all separated by 0s
        zero_pad = [0,0];
        %surround num with 0s
        row_num = [zero_pad(1),num,zero_pad(end)];
        %this is just how I got it to choose a certain row
        %if the length of the num variable is equal to the
        %# row desired, the question asked to display that row
        length_num = length(num);
        
        clear num;
        %after this, num is 2 vals, then 3 vals
        %row_num 1st element is 0 and last element is 0
        %3rd row, 3 nums there
        %(# of row = amount of numbers)
        for i = 1:1:length(row_num)-1
            %add the elements in the row_num vector together
            num(i) = row_num(i) + row_num(i + 1);
        end
        
    end
    
end

