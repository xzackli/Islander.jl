# Science Conventions

## Array Indexing
Julia has 1-based indexing, the usual convention for science-focused languages (Fortran / R / Matlab / Mathematica). If you are interested in studying reality and not pointer offsets, this is an acceptable indexing scheme.

However, 1-based indexing is problematic for the multipole moment ``C_{\ell}``, which can have a monopole ``\ell = 0``. In this code, **every multipole moment vector ignores the monopole**. That is, ``C_{\ell=5}`` corresponds to `cl_vector[5]`. This has the added benefit that you can convert between ``C_{\ell}`` and ``D_{\ell}`` without dividing by zero. To interface with Python codes, you will have to pad your array with a monopole value (i.e. with [`Islander.ellpad()`](@ref)).

## FFT Normalizations
We choose the normalization such that applying the FFT twice induces only a phase flip but no amplitude change, and `ifft(fft(x))` is the identity.
