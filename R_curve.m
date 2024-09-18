function [x, y, Rad]=R_curve(r)
    Rad = 1/(r+1);
    x = Rad*r;
    y = 0;
end