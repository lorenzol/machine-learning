%% function func = getFunc(w)
% Function that returns a function from w
% Useful for seeing what equation is derived from w
%
% Returns a function i.e f(x) = 0.1x^2 + 2x + 10
%
% =====================================================
%
function func = getFunc(w)

d = length(w);

y_str = '@(x) '; % create y-fit function handle 

for i = 1:d % for every order
        if i ~= 1 % add + after initial
            y_str = strcat(y_str, '+');
        end    
        y_str = strcat(y_str, num2str(w(i)));   %add weight
        y_str = strcat(y_str, '*x.^');          % add x function
        y_str = strcat(y_str, num2str((d-i)));  % add degree
end

func = str2func(y_str); % function will return the function as a string

end % end function getFunc
