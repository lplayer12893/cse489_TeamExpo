function A = writeOutputs(m,t,filename)

csvwrite(filename, [m t]);

A = 1;