% The make utility for all the C and MEX code
% The code was modified as well as oriented in https://titanwolf.org/Network/Articles/Article?AID=896594ba-41b1-44e0-9e34-591682e81b96#gsc.tab=0
function make(command)

if (nargin > 0 && strcmp(command,'clean'))
    delete('*.mexglx');
    delete('*.mexw32');
    delete('lsmlib/*.mexglx');
    delete('lsmlib/*.mexw32');
    return;
end
mex DT.c
mex height_function_der.c
mex height_function_grad.c
mex local_min.c
mex zero_crossing.c
mex get_full_speed.c
mex corrDn.c wrap.c convolve.c edges.c
mex upConv.c wrap.c convolve.c edges.c

cd lsmlib
mex computeDistanceFunction2d.c FMM_Core.cpp FMM_Heap.cpp lsm_FMM_field_extension2d.cpp
mex computeExtensionFields2d.c FMM_Core.cpp FMM_Heap.cpp lsm_FMM_field_extension2d.cpp
mex doHomotopicThinning.c FMM_Core.cpp FMM_Heap.cpp lsm_FMM_field_extension2d.cpp
cd ..