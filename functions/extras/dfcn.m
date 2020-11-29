function da = dfcn(fcn,z)
eps = 1e-6;
da = (fcn(z+eps)-fcn(z-eps))/(2*eps);
end