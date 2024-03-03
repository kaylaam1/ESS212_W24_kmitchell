function O = O1_iter(n)
% O = O1_iter(n)
% Computes the sum of the first n odd integers
% i.e., it is equivalent to sum(1:2:(2*n-1))
    O = 0;
    for i = 1:n
        O = O + (2*i - 1);
    end
end

