// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

import { IBaseWorld } from "@latticexyz/world/src/interfaces/IBaseWorld.sol";

import { IBolid } from "./IBolid.sol";
import { IIncrementSystem } from "./IIncrementSystem.sol";
import { ILineup } from "./ILineup.sol";
import { ITrackBuild } from "./ITrackBuild.sol";

/**
 * The IWorld interface includes all systems dynamically added to the World
 * during the deploy process.
 */
interface IWorld is IBaseWorld, IBolid, IIncrementSystem, ILineup, ITrackBuild {

}