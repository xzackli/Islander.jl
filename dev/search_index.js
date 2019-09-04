var documenterSearchIndex = {"docs":
[{"location":"conventions/#Science-Conventions-1","page":"Conventions","title":"Science Conventions","text":"","category":"section"},{"location":"conventions/#Array-Indexing-1","page":"Conventions","title":"Array Indexing","text":"","category":"section"},{"location":"conventions/#","page":"Conventions","title":"Conventions","text":"Julia has 1-based indexing, the usual convention for science-focused languages (Fortran / R / Matlab / Mathematica). If you are interested in studying reality and not pointer offsets, this is an acceptable indexing scheme.","category":"page"},{"location":"conventions/#","page":"Conventions","title":"Conventions","text":"However, 1-based indexing is problematic for the multipole moment C_ell, which can have a monopole ell = 0. In this code, every multipole moment vector ignores the monopole. That is, C_ell=5 corresponds to cl_vector[5]. This has the added benefit that you can convert between C_ell and D_ell without dividing by zero. To interface with Python codes, you will have to pad your array with a monopole value (i.e. with Islander.ellpad()).","category":"page"},{"location":"conventions/#FFT-Normalizations-1","page":"Conventions","title":"FFT Normalizations","text":"","category":"section"},{"location":"conventions/#","page":"Conventions","title":"Conventions","text":"We choose the normalization such that applying the FFT twice induces only a phase flip but no amplitude change, and ifft(fft(x)) is the identity.","category":"page"},{"location":"#Islander.jl-1","page":"Home","title":"Islander.jl","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Islander will be a nice component separation code someday!","category":"page"},{"location":"#","page":"Home","title":"Home","text":"","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Modules = [Islander]\nOrder   = [:type, :function]\nPages   = [\"Islander.jl\", \"Pixell.jl\"]","category":"page"},{"location":"#Islander.Enmap","page":"Home","title":"Islander.Enmap","text":"Map type, contains an AbstractArray and a WCS object, but behaves like the AbstractArray it contains for array operations.\n\nIt only implements the subset of Base.Array operations which are common on maps. You should work with the data directly using enmap_instance.data if you need additional Array functions.\n\n\n\n\n\n","category":"type"},{"location":"#Islander.enfft!-Union{Tuple{Enmap{T,N,AA}}, Tuple{AA}, Tuple{N}, Tuple{T}} where AA where N where T","page":"Home","title":"Islander.enfft!","text":"Physically normalized enmap FFT\n\n\n\n\n\n","category":"method"},{"location":"#Islander.enifft!-Union{Tuple{Enmap{T,N,AA}}, Tuple{AA}, Tuple{N}, Tuple{T}} where AA where N where T","page":"Home","title":"Islander.enifft!","text":"Physically normalized enmap inverse FFT\n\n\n\n\n\n","category":"method"},{"location":"#Islander.ell_binpow","page":"Home","title":"Islander.ell_binpow","text":"Quick and dirty binned, flat-sky power spectra.\n\n\n\n\n\n","category":"function"},{"location":"#Islander.ellpad-Union{Tuple{Array{T,N}}, Tuple{N}, Tuple{T}} where N where T","page":"Home","title":"Islander.ellpad","text":"Utility function which prepends some zeros to an array. It makes a copy instead of modifying the input.\n\n\n\n\n\n","category":"method"},{"location":"#Islander.inverse_gamma-Union{Tuple{Array{T,1}}, Tuple{T}} where T","page":"Home","title":"Islander.inverse_gamma","text":"Draws an inverse gamma distribution given the sky map spectrum.\n\n\n\n\n\n","category":"method"},{"location":"#Islander.util_get_cltt","page":"Home","title":"Islander.util_get_cltt","text":"Utility function to load C_ell^TT when working in the notebooks.\n\n\n\n\n\n","category":"function"}]
}
