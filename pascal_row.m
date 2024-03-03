function h = pascal_row(x,pick_a_row)
    %start with a k that is x-1
    %this k gives an index for the tab for the pyramid shape
    %(every time, k is smaller, less tabbing on the left side)
    k = x-1;
    %first row is 1
    num = 1;
    
    
    for i = 1:1:x
        for j = 1:1:k
            
        end 
        for j = 1:1:i
            %variable that is 0, so we can print the 0s
            zeros_print = 0;
            
        end
        k = k-1;
        
        %the numbers are all separated by 0s
        zero_pad = [0,0];
        %surround num with 0s
        row_num = [zero_pad(1),num,zero_pad(end)];
        %this is just how I got it to choose a certain row
        %if the length of the num variable is equal to the
        %# row desired, the question asked to display that row
        length_num = length(num);
        if length_num == pick_a_row 
            %if the size of the row is correct,
            display_row = zeros(1,3*2);
            %populate every other non-zero element with the numbers
            %in the current "num" variable corresponding to the
            %row that was picked
            display_row(1,2:2:end) = num;
            display_row(2:end)
        end
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
