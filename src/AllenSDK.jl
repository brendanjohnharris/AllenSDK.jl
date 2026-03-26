module AllenSDK
using PythonCall
import CondaPkg

export pynwb, allensdk, behavior_ecephys_session, ecephys

const pynwb = PythonCall.pynew()
const allensdk = PythonCall.pynew()
const behavior_ecephys_session = PythonCall.pynew()
const ecephys = PythonCall.pynew()
const ecephys_project_cache = PythonCall.pynew()
const h5py = PythonCall.pynew()

function __init__()
    # On Windows, add the conda env's Library/bin to PATH so h5py can find the HDF5 DLLs
    if Sys.iswindows()
        libbin = joinpath(CondaPkg.envdir(), "Library", "bin")
        if isdir(libbin)
            ENV["PATH"] = libbin * ";" * get(ENV, "PATH", "")
        end
    end
    PythonCall.pycopy!(pynwb, pyimport("pynwb"))
    PythonCall.pycopy!(allensdk, pyimport("allensdk"))
    PythonCall.pycopy!(behavior_ecephys_session, pyimport("allensdk.brain_observatory.ecephys.behavior_ecephys_session"))
    PythonCall.pycopy!(ecephys, pyimport("allensdk.brain_observatory.ecephys"))
    PythonCall.pycopy!(ecephys_project_cache,
        pyimport("allensdk.brain_observatory.ecephys.ecephys_project_cache"))
    PythonCall.pycopy!(h5py, pyimport("h5py"))
end

end
