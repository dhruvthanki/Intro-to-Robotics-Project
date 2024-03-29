function q = trajectory2(t)

q = [];
if t<=1000
    q = [0.9099,0.3576,0.4660];
    q = q - [0,0,(4.66*10^(-4))*t];
end
if t>1000 && t<=2000
    q = [0.9099,0.3576,0];
    q = q - [0,(7.765*10^(-4))*(t-1000),0];
end
if t>2000 && t<=3000
    q = [0.9099,-0.4189,0];
    q = q + [0,0,(4.66*10^(-4))*(t-2000)];
end
q = [q,-0.0000,1.5758,1.5661];
end