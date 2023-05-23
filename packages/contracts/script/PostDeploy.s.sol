// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";
import {TrackProp,TrackDesign} from "../src/codegen/Types.sol";


contract PostDeploy is Script {

  struct GridProp {
    uint8 curb;
    uint8 curbstyle;
    uint8 road;
    uint8 spe1;
    uint8 spe2;
    uint8 spe3;
    
  }
  struct TrackDest{
    TrackDesign s;
    TrackDesign l;
    TrackDesign r;
  }

  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);

    // ------------------ EXAMPLES ------------------

    // Call increment on the world via the registered function selector
    /*
    uint32 newValue = IWorld(worldAddress).Flivver_IncrementSystem_increment();
    console.log("Increment via IWorld:", newValue);
    */

    GridProp memory gp;
    TrackDest memory td;

    uint32 height=uint32(520);
    uint32 width=uint32(20+1);
    
    bytes memory grid = new bytes(width*height);
    grid[0]=bytes1(uint8(1));
    

    TrackProp curb =TrackProp.Curb1;
    TrackProp curbstyle =TrackProp.Curb3;
    TrackProp road= TrackProp.Road3;
    TrackProp spe1= TrackProp.Spe3;
    TrackProp spe2= TrackProp.Spe4;

    td.s=TrackDesign.Center;
    td.l=TrackDesign.Left;
    td.r=TrackDesign.Right;

    //gp.curb=0;
    //gp.curbstyle=1;
    //gp.road=2;
    //gp.spe1=3;
    //gp.spe2=4;
    //gp.spe3=5;

    //td.s=1;
    //td.l=0;
    //td.r=2;
    string memory nameandkey="SceleRace";

    for(uint32 y=0; y<height;y++){
      for(uint32 x=0; x<width;x++){
        uint32 ind=(y*width)+x;
        if(x==0){
          if(ind> (12*width) && ind<(40*width)){
            grid[ind]=bytes1(uint8(td.l));
          }
          else if(ind> (126*width) && ind<(152*width)){
            grid[ind]=bytes1(uint8(td.r));
          }
          else{
            grid[ind]=bytes1(uint8(td.s));
          }
            
        }
        else if(x==1 || x== (width-1) ){
          if(y%4==0){
            grid[ind]=bytes1(uint8(curbstyle));
          }
          else{
            grid[ind]=bytes1(uint8(curb));
          }
          
        }
        else if( y%17==0 && x== 15 && y!=0){
          grid[ind]=bytes1(uint8(spe1));
        }
        else if( y%23==0 && x== 4 && y!=0){
          grid[ind]=bytes1(uint8(spe2));
        }
        else{
          grid[ind]=bytes1(uint8(road));
        }

      }
    }

    uint32 newValue = IWorld(worldAddress).Flivver_TrackBuild_buildTrack(nameandkey,width,height,grid);
    //IWorld(worldAddress).Flivver_TrackBuild_buildTrack(nameandkey,width,height,grid);
    //uint32 newValue = IWorld(worldAddress).Flivver_TrackBuild_generateGrid()
    console.log("Increment via IWorld:", newValue);

    //GridTrack.set(worldAddress,width,height,grid);
    vm.stopBroadcast();
  }
}


//{"width":8,"height":42,"grid":"0x010102030402020101000202020202000100020202020200010002020202020001010202020202010100020302020200010002020202020001000202040202000101020202020201010002020202020001000203020202000100020202020200010102020202020100000202020202000000020204020200000002030202020000010202020202010000020202020200000002020202020000000202020202000101020302020201010002020402020001000202020202000100020202020200010102020202020101000203020202000100020202020200020002020202020002010202040202010200020202020200020002030202020002000202020202000101020202020201010002020202020001000202020202000100020304020200010102020202020101000202020202000100020202020200010002020202020001010203020202010100020202020200"}


//{"width":8,"height":42,"grid":"0x010102030402020101000202020202000100020202020200010002020202020001010202020202010100020302020200010002020202020001000202040202000101020202020201010002020202020001000203020202000100020202020200010102020202020100000202020202000000020204020200000002030202020000010202020202010000020202020200000002020202020000000202020202000101020302020201010002020402020001000202020202000100020202020200010102020202020101000203020202000100020202020200020002020202020002010202040202010200020202020200020002030202020002000202020202000101020202020201010002020202020001000202020202000100020304020200010102020202020101000202020202000100020202020200010002020202020001010203020202010100020202020200"}


//{"width":8,"height":42,"grid":"0x010203030403030201000303030303000100030303030300010003030303030001020303030303020100030303030300010003030303030001000303040303000102030303030302010003030303030001000303030303000100030303030300010203030303030200000303030303000000030304030300000003030303030000020303030303020000030303030300000003030303030000000303030303000102030303030302010003030403030001000303030303000100030303030300010203030303030201000303030303000100030303030300020003030303030002020303040303020200030303030300020003030303030002000303030303000102030303030302010003030303030001000303030303000100030304030300010203030303030201000303030303000100030303030300010003030303030001020303030303020100030303030300"}

//{"width":8,"height":42,"grid":"0x010205080905050201000505050505000100050505050500010005050505050001020505050505020100050805050500010005050505050001000505090505000102050505050502010005050505050001000508050505000100050505050500010205050505050200000505050505000000050509050500000005080505050000020505050505020000050505050500000005050505050000000505050505000102050805050502010005050905050001000505050505000100050505050500010205050505050201000508050505000100050505050500020005050505050002020505090505020200050505050500020005080505050002000505050505000102050505050502010005050505050001000505050505000100050809050500010205050505050201000505050505000100050505050500010005050505050001020508050505020100050505050500"}