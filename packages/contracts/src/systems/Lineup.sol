// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import {GridBolid, RaceRegister } from "../codegen/Tables.sol";

contract Lineup is System {

  function participate() public  returns (uint32) {
    bytes32 placerAddress= bytes32(uint256(uint160(_msgSender())));
    bool ower=GridBolid.getStateMind(placerAddress);
    if(ower== true) { revert(); }
    //OwnerList.set(placerAddress,_msgSender());
    GridBolid.set(placerAddress,_msgSender(),true,false,false,"sleep");
    return 0;
  }

  function readyOrNot(string memory nameandkey) public returns (uint32) {
    bytes32 placerAddress= bytes32(uint256(uint160(_msgSender())));
    bool ower=GridBolid.getStateMind(placerAddress);
    if(ower!= true) { revert(); }
    bool status=GridBolid.getStateFiz(placerAddress);
    if(status == true){ revert(); }

    bytes32 st; 
    assembly {
        st := mload(add(nameandkey, 32))
    }
    GridBolid.setStateLoc(placerAddress,nameandkey);
    uint32 vv=RaceRegister.getRacer(st)+1;
    RaceRegister.setRacer(st,vv);
    //RaceRegister.set("SceleRace",true,0,0,false,false,st);
    GridBolid.setStateFiz(placerAddress,true);

    if(vv==2){
      RaceRegister.setStarting(st,uint64(block.timestamp));
    }

    return 0;
  }

  function starting(string memory nameandkey) public returns (uint64){
    bytes32 st; 
    assembly {
        st := mload(add(nameandkey, 32))
    }
    uint64 t=RaceRegister.getStarting(st);
    require(t>0);
    require(RaceRegister.getGo(st)==false);
    uint64 del=uint64(block.timestamp)-t;
    if(del>8){
      RaceRegister.setStarting(st,0);
      RaceRegister.setGo(st,true);
    }
    return del;
  }
}
