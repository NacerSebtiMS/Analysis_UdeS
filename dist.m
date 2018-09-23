function d = dist(v1,v2)

v = v2 - v1;
v = v .^2;
d = sum(v);
    
end