# Autogenerated wrapper script for libass_jll for x86_64-w64-mingw32
export libass

using FreeType2_jll
using FriBidi_jll
using Bzip2_jll
using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libass`
const libass_splitpath = ["bin", "libass-9.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libass_path = ""

# libass-specific global declaration
# This will be filled out by __init__()
libass_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libass = "libass-9.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libass")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (FreeType2_jll.PATH_list, FriBidi_jll.PATH_list, Bzip2_jll.PATH_list, Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (FreeType2_jll.LIBPATH_list, FriBidi_jll.LIBPATH_list, Bzip2_jll.LIBPATH_list, Zlib_jll.LIBPATH_list,))

    global libass_path = normpath(joinpath(artifact_dir, libass_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libass_handle = dlopen(libass_path)
    push!(LIBPATH_list, dirname(libass_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()

