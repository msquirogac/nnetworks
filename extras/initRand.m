function x = initRand(x)
x = rand(size(x));
x = x/norm(x);
end