%Homework 1, Kayla Mitchell ESS 212
clear all

%run the whole code at once and all the answers are 
%displayed

%first, specify values to input into functions
%(assign variables)
%functions are at the end of the script

%for Problem 2
%make string variable of the coding language
language = "MatLab says:";
fprintf('%s',language)
%add hello world! and use \n to return to new line
fprintf(' hello world! \n');

%for Problem 3
%made n a positive integer, 7
n = 7;
%use functions to get result for S1_n
S1_n_rec = S1_rec(n);
S1_n_iter = S1_iter(n);
%verify that the function gives correct response
%using left hand side of S1_n equation
check_n_LHS = 1 + 2 + 3 + 4 + 5  + 6 + n;
%using right hand side of S1_n equation
check_n_RHS = (n*(n+1))/2;
%evaluate O(n) with my function
O1_n = O1_iter(n);
all_n = 1:n;
%check my function for O(n) using LHS of equation
check_O1_LHS = sum(all_n*2 - 1);
%check my function for O(n) using RHS of equation
check_O1_RHS = n^2;
%evaluate S2(n) with my function
S2_n = S2_iter(n);
%check my function for O(n) using LHS of equation
check_S2_LHS = 1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + n^2;
%check my function for O(n) using RHS of equation
check_S2_RHS = (n*(n+1)*(2*n +1)) / 6;
%ensured all give same result

%for Problem 4
%this is where user can pick_a_row
%the question asked for row 3
pick_a_row = 3;
%make the pascal triangle as shown on the homework
%and specified with equations (more on this below in the
%actual function section
pascal_triangle2(9,pick_a_row);
%display only one row, specified as pick a row
pascal_triangle3(9,pick_a_row);

%For Problem 5
%here are some positive integers
n_vals = [1,2,3,4,5];
%here are real numbers where we test cases
%where r < 0, 0 < r < 1, r=1, and r > 1
r_vals = [-3, 0, 0.5, 3];
%you can uncomment these r_vals and running the code
%will give you an error because r = 1 is not possible 
%(you cannot divide by 0)
% r_vals = [-3, 0, 0.5, 1, 3];
%I guess we can choose any value for a? I choose 3
a = 3; 

for n = n_vals
    for r = r_vals
%run the function
        Sn = geo_prog_sum(n, r, a);
%print the results
        fprintf('n=%d, r=%.2f, Sn=%.4f\n', n, r, Sn);
    end
end
fprintf('as r approaches 1, Sn approaches infinity \n')
fprintf('the closer the denominator is to 0,\n the bigger Sn grows\n')
fprintf('however, if n = 1, Sn will be 0,\n because the numerator would be 0 \n')
fprintf('if n=0, it would also be 0,\n but n was specified to be a positive integer \n')

fprintf('if you specify an r-val of zero,\n the code will send an error \n')

%---------------------------------------------
%Functions for Problem 3
%these have been given to us in the assingment
%recursive
function S = S1_rec(n)
if n > 1
S = n + S1_rec(n-1);
else
S = 1;
end
end
%iterative
function S = S1_iter(n)
S = 0;
for i = 1:n
S = S+i;
end
end

%make a function for the O equation
%I chose iterative
function O = O1_iter(n)
O = 0;
for i = 1:n
%using the LHS of the equation, I can solve
%O(n) like this:
O = O + (2*i - 1);
end
end

%write a function for solving S2(n)
%I chose iterative
function S2 = S2_iter(n)
S2 = 0;
for i = 1:n
S2 = S2 + (i^2);
end
end




%---------------------------------------------

%function for Problem 4
% first row always 1, add 0 and 0 to left hand side and right hand side
% add one 0 to left and 0 to right, 1+ 0 = 1
% below the 1, it is sum of two elements above it 
% (the bottom is centered beneath them)
        function h = pascal_triangle2(x,pick_a_row)
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


        %same function as above but just displays the one row you pick

        function h = pascal_triangle3(x,pick_a_row)
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

%---------------------------------------------
        
%function for Problem 5
%evaluate Sn for any value of r
%accept two parameters, n and r (n is a positive integer)
%r is any real number
   function Sn = geo_prog_sum(n, r, a)


    if r == 1
%display error because if r is 1, the denominator
%of Sn is 0, which is invalid

        error('Invalid value for r (1).');

    end

    Sn = a * (1 - r^n) / (1 - r);
         
end

