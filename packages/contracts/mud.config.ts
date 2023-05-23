import { mudConfig } from "@latticexyz/world/register";
import { deserialize } from "v8";

export default mudConfig({
  //worldContractName: "Physalis",
  namespace: "Flivver",
  systems: {
    TrackBuild: {
      name: "TrackBuild",
      openAccess: true,
    },
    Bolid: {
      name: "Bolid",
      openAccess: true,
    },
    Lineup:{
      name: "Lineup",
      openAccess: true,
    },
  },
  enums:{
    TrackProp:["Curb1","Curb2","Curb3","Road1","Road2","Road3","Spe1","Spe2","Spe3","Spe4"],
    TrackDesign:["Left","Center","Right","Up","Down","O1","O2"],
  },
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    GridBolid: {
      schema: {
        playerRef:"address",
        stateMind: "bool",
        stateFiz: "bool",
        position:"bool",
        stateLoc: "string",
        
      }
    },
    OwnerList:{
      schema:{
        owner:"address",
      }
    },
    GridTrack: {
      schema: {
        width: "uint32",
        height: "uint32",
        grid: "bytes",
      },
    },
    RaceRegister: {
      schema: {
        active:"bool",
        racer:"uint32",
        ontrack:"uint32",
        starting:"uint64",
        go:"bool",
        prog:"bool",
        nameandkey:"string",
      }
    },
    FizState: {
      schema: {
        x: "int32",
        y: "int32",
        z: "int32",
        dx: "int32",
        dy: "int32",
        dz: "int32",
        ax: "int32",
        ay: "int32",
        az: "int32",
        lTs:"uint64",
        ts:"uint64",
        stat:"bool",
      }
    }
  },
  modules: [],
});