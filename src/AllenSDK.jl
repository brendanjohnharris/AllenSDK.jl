module AllenSDK
using PythonCall

export pynwb, allensdk, behavior_ecephys_session, ecephys

const pynwb = PythonCall.pynew()
const allensdk = PythonCall.pynew()
const behavior_ecephys_session = PythonCall.pynew()
const ecephys = PythonCall.pynew()
const ecephys_project_cache = PythonCall.pynew()


function __init__()
    PythonCall.pycopy!(pynwb, pyimport("pynwb"))
    PythonCall.pycopy!(allensdk, pyimport("allensdk"))
    PythonCall.pycopy!(behavior_ecephys_session, pyimport("allensdk.brain_observatory.ecephys.behavior_ecephys_session"))
    PythonCall.pycopy!(ecephys, pyimport("allensdk.brain_observatory.ecephys"))
    PythonCall.pycopy!(ecephys_project_cache, pyimport("allensdk.brain_observatory.ecephys.ecephys_project_cache"))
end

end
