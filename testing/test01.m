x = -5:5;
j1 = 1:11;
j2 = ones(size(x));

% Testing nnBinary
disp('Testing nnBinary')
clearvars -except x j1 j2
af = nnBinary();
y  = [zeros(1,5) ones(1,6)];
assert(isequal(forwProp(af, x), y))

d1 = [zeros(1,5) 6 zeros(1,5)];
assert(isequal(backProp(af, j1), d1))

d2 = [zeros(1,5) 1 zeros(1,5)];
assert(isequal(backProp(af, j2), d2))
disp('Pass')

% Testing nnLReLU
disp('Testing nnLReLU')
clearvars -except x j1 j2
af = nnLReLU();
y  = [0.01*(-5:-1), 0:5];
assert(isequal(forwProp(af, x), y))

d1 = [0.01*(1:5), 6:11];
assert(isequal(backProp(af, j1), d1))

d2 = [0.01*ones(1,5), ones(1,6)];
assert(isequal(backProp(af, j2), d2))
disp('Pass')

% Testing nnReLU
disp('Testing nnReLU')
clearvars -except x j1 j2
af = nnReLU();
y  = [zeros(1,5), 0:5];
assert(isequal(forwProp(af, x), y))

d1 = [zeros(1,5), 6:11];
assert(isequal(backProp(af, j1), d1))

d2 = [zeros(1,5), ones(1,6)];
assert(isequal(backProp(af, j2), d2))
disp('Pass')

% Testing nnSigmoid
disp('Testing nnSigmoid')
clearvars -except x j1 j2
af = nnSigmoid();
f  = @(x) (1+exp(-x)).^-1;
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnSoftMax
disp('Testing nnSoftMax')
clearvars -except x j1 j2
af = nnSoftMax();
f  = @(x) exp(x)./sum(exp(x),1);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnSwish
disp('Testing nnSwish')
clearvars -except x j1 j2
af = nnSwish();
f  = @(x) x.*(1+exp(-x)).^-1;
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnTanh
disp('Testing nnTanh')
clearvars -except x j1 j2
af = nnTanh();
f  = @(x) (exp(x)-exp(-x))./(exp(x)+exp(-x));
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnAtan
disp('Testing nnAtan')
clearvars -except x j1 j2
af = nnAtan();
f  = @(x) atan(x);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnSin
disp('Testing nnSin')
clearvars -except x j1 j2
af = nnSin();
f  = @(x) sin(x);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnCos
disp('Testing nnCos')
clearvars -except x j1 j2
af = nnCos();
f  = @(x) cos(x);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnXSin
disp('Testing nnXSin')
clearvars -except x j1 j2
af = nnXSin();
f  = @(x) x.*sin(x);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnXCos
disp('Testing nnXCos')
clearvars -except x j1 j2
af = nnXCos();
f  = @(x) x.*cos(x);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-8)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-8)))
disp('Pass')

% Testing nnELU
disp('Testing nnELU')
clearvars -except x j1 j2
af = nnELU();
b=2;
f  = @(x) x.*(x>0) + (exp(x)-1).*(x<=0);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-6)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-6)))
disp('Pass')

% Testing nnCELU
disp('Testing nnCELU')
clearvars -except x j1 j2
af = nnCELU();
b=4;
af.b=b;
f  = @(x) x.*(x>0) + b*(exp(x/b)-1).*(x<=0);
y  = f(x);
assert(all(ismembertol(y, forwProp(af, x),1e-8)))

d1 = dfcn(f,x).*j1;
assert(all(ismembertol(d1, backProp(af, j1),1e-6)))

d2 = dfcn(f,x).*j2;
assert(all(ismembertol(d2, backProp(af, j2),1e-6)))
disp('Pass')