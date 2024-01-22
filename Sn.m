function v = Sn(n, r, a)
    
    
    if r == 1
        %display error because if r is 1, the denominator
        %of Sn is 0, which is invalid
        
        error('Invalid value for r (1).');
        
    end
    v = a * (1 - r^n) / (1 - r);
    
end
