%% function plotFunc(x, y, w)
% Function that plots equations.
%
% Wrote function because it is used many times in program.
%
% =====================================================
%
function plotFunc(x, y, w)

    d = length(w);          %get length of w(degrees)
    y_fh = getFunc(w);      %get funcion from w

    % Plot the polynomial with degree d
    hold on;                % on samer plot
    plot(x, y, 'rx');       % Plot the data
    x_s = sort(x);          %sorted x values
    plot(x_s,y_fh(x_s));    %plot linear regression equation    

    %Title of Legend of plot
    leg_d = strcat('degree-', num2str(d-1));
    leg_d = strcat(leg_d, ' polynomial regression');
    legend('Training data', leg_d ,'Location','southeast');

    hold off             % don't overlay plots

end % end function plotFunc
