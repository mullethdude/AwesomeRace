// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";

import { NamespaceOwner } from "@latticexyz/world/src/tables/NamespaceOwner.sol";
import { ROOT_NAMESPACE } from "@latticexyz/world/src/constants.sol";

import {GridBolid, RaceRegister, GridTrack } from "../codegen/Tables.sol";

contract TrackBuild is System {
  function generateGrid() public view returns (uint32) {

    return 42;
  }

  function buildTrack(string memory nameandkey,uint32 width, uint32 height, bytes memory grid) public returns (uint32) {
    
    
    bytes32 bytestring;
    
    assembly {
        bytestring := mload(add(nameandkey, 32))
    }
    require(GridTrack.getWidth(bytestring)==0);
    GridTrack.set(bytestring,width,height,grid);

    return 0;
  }

  function genRace(string memory nameandkey) public  returns (uint32) {
    bytes32 st; 
    assembly {
        st := mload(add(nameandkey, 32))
    }
    require((keccak256(abi.encodePacked((RaceRegister.getNameandkey(st)))))!= (keccak256(abi.encodePacked((nameandkey)))));
    RaceRegister.set( st,true,0,0,0,false,false,nameandkey);
    return 42;
  }
}


