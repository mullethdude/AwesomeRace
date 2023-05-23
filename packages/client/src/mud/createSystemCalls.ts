import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { worldSend, worldCall, txReduced$, singletonEntity,playerEntity }: SetupNetworkResult,
  { Counter, GridBolid, FizState, RaceRegister}: ClientComponents
) {
  let go;
  const increment = async () => {
    const tx = await worldSend("Flivver_IncrementSystem_increment", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };

  const partici = async () => {
    console.log(playerEntity);
    console.log(getComponentValue(GridBolid,playerEntity));
    await worldSend("Flivver_Lineup_participate", []);

    return getComponentValue(GridBolid,playerEntity);
  };

  const callGen = async () => {

    const tx = await worldSend("Flivver_TrackBuild_genRace", ["SceleRace"]);

    return tx;
  };

  const ready = async () => {
    const tx = await worldSend("Flivver_Lineup_readyOrNot", ["SceleRace"]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    console.log(getComponentValue(GridBolid,playerEntity).stateLoc);
    return tx;
  };


  const startRace = async () => {
    const tx = await worldSend("Flivver_Bolid_placeCar", ["SceleRace"]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);

    return tx;
  };


  const countDown = async () => {
    if(!go){
    const tx = await worldSend("Flivver_Lineup_starting", ["SceleRace"]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    console.log('O0OFIHFHFIdsdddddddd',tx);
    return tx;
    }
    else{
      return 0;
    }
  }

  async function cwv (x,z,dx,dz,ax,az){
    
    
    for (const entity of RaceRegister.entities() ) {
      
      go=getComponentValue(RaceRegister,entity).go;
      break;
  
    }
    if(go){
      const tx = await worldSend("Flivver_Bolid_moveCar", [x,z,dx,dz,ax,az]);
      return tx;
    }
    else{
      return 0;
    }
    
  }


  return {
    partici,
    increment,
    callGen,
    ready,
    startRace,
    cwv,
    countDown,
  };
}
