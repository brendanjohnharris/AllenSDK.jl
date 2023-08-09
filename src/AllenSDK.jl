module AllenSDK
using PythonCall

export pynwb, allensdk, behavior_ecephys_session

const pynwb = PythonCall.pynew()
const allensdk = PythonCall.pynew()
const behavior_ecephys_session = PythonCall.pynew()

function __init__()
    PythonCall.pycopy!(pynwb, pyimport("pynwb"))
    PythonCall.pycopy!(allensdk, pyimport("allensdk"))
    PythonCall.pycopy!(behavior_ecephys_session, pyimport("allensdk.brain_observatory.ecephys.behavior_ecephys_session"))
end

end
