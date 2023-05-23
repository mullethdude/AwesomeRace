// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { FizState, GridBolid, RaceRegister  } from "../codegen/Tables.sol";


contract Bolid is System {

    function placeCar(string memory nameandkey) public{
        bytes32 placerAddress= bytes32(uint256(uint160(_msgSender())));
        bool status=GridBolid.getStateFiz(placerAddress);
        if(status == false){ revert(); }
        else if(GridBolid.getPosition(placerAddress)==true){
            revert();
        }
        bytes32 st; 
        assembly {
            st := mload(add(nameandkey, 32))
        }
        int32 t=int32(RaceRegister.getOntrack(st));
        GridBolid.setPosition(placerAddress,true);
        t=t+1;
        RaceRegister.setOntrack(st,uint32(t));
        FizState.set(placerAddress,(((t+1)%2)*6+7)*1000,1000,(((t-1)/2)*2)*1000,0,0,0,0,0,0,0,0,false);
    }
    function moveCar(int32 x, int32 z, int32 dx,int32 dz, int32 ax,int32 az) public{
       
        bytes32 placerAddress= bytes32(uint256(uint160(_msgSender())));
        require(GridBolid.getStateFiz(placerAddress)==true);
        require(RaceRegister.getGo("SceleRace")==true);
        bool gogo =FizState.getStat(placerAddress);
        if(gogo==false){
            FizState.setStat(placerAddress,true);
            FizState.setLTs(placerAddress,uint64(block.timestamp));
            FizState.setAx(placerAddress,0);
            FizState.setAz(placerAddress,0);
        }
        else{
            int32 nax=ax;
            FizState.setAx(placerAddress,nax);
            int32 naz=az;
            FizState.setAz(placerAddress,naz);
        }
        uint64 delta=(uint64(block.timestamp)-FizState.getLTs(placerAddress))*1000;
        //int64 d= int64(delta);
        int32 nx=FizState.getX(placerAddress)+dx*int32(int64(delta));
        FizState.setX(placerAddress,nx);
        int32 nz=FizState.getZ(placerAddress)+dz*int32(int64(delta));
        FizState.setZ(placerAddress,nz);

        int32 ndx=dx;
        FizState.setDx(placerAddress,ndx);
        int32 ndz=dz;
        FizState.setDz(placerAddress,ndz);
        
        FizState.setLTs(placerAddress,uint64(block.timestamp));
        FizState.setTs(placerAddress,uint64(delta));
    }


    function sqrt(uint y) internal pure returns (uint z) {
    if (y > 3) {
        z = y;
        uint x = y / 2 + 1;
        while (x < z) {
            z = x;
            x = (y / x + x) / 2;
        }
    } else if (y != 0) {
        z = 1;
    }
}

}
