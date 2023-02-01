-- Copyright GMNGjoy

CollectRocksAtMissions = {};
function CollectRocksAtMissions:loadMap(name)
    MissionManager.getIsMissionWorkAllowed = Utils.overwrittenFunction(MissionManager.getIsMissionWorkAllowed, CollectRocksAtMissions.getIsMissionWorkAllowed);
end; 

function CollectRocksAtMissions:getIsMissionWorkAllowed(superFunc, farmId, x, z, workAreaType)
    return superFunc(self, farmId, x, z, workAreaType) or (
        (workAreaType == WorkAreaType.STONEPICKER) and (
            superFunc(self, farmId, x, z, WorkAreaType.SOWINGMACHINE) or
            superFunc(self, farmId, x, z, WorkAreaType.CULTIVATOR)
        )
    );
end

addModEventListener(CollectRocksAtMissions);

