// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("Flivver"), bytes16("GridBolid")));
bytes32 constant GridBolidTableId = _tableId;

struct GridBolidData {
  address playerRef;
  bool stateMind;
  bool stateFiz;
  bool position;
  string stateLoc;
}

library GridBolid {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](5);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.BOOL;
    _schema[2] = SchemaType.BOOL;
    _schema[3] = SchemaType.BOOL;
    _schema[4] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](5);
    _fieldNames[0] = "playerRef";
    _fieldNames[1] = "stateMind";
    _fieldNames[2] = "stateFiz";
    _fieldNames[3] = "position";
    _fieldNames[4] = "stateLoc";
    return ("GridBolid", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get playerRef */
  function getPlayerRef(bytes32 key) internal view returns (address playerRef) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get playerRef (using the specified store) */
  function getPlayerRef(IStore _store, bytes32 key) internal view returns (address playerRef) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set playerRef */
  function setPlayerRef(bytes32 key, address playerRef) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((playerRef)));
  }

  /** Set playerRef (using the specified store) */
  function setPlayerRef(IStore _store, bytes32 key, address playerRef) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((playerRef)));
  }

  /** Get stateMind */
  function getStateMind(bytes32 key) internal view returns (bool stateMind) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get stateMind (using the specified store) */
  function getStateMind(IStore _store, bytes32 key) internal view returns (bool stateMind) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set stateMind */
  function setStateMind(bytes32 key, bool stateMind) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((stateMind)));
  }

  /** Set stateMind (using the specified store) */
  function setStateMind(IStore _store, bytes32 key, bool stateMind) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((stateMind)));
  }

  /** Get stateFiz */
  function getStateFiz(bytes32 key) internal view returns (bool stateFiz) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get stateFiz (using the specified store) */
  function getStateFiz(IStore _store, bytes32 key) internal view returns (bool stateFiz) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set stateFiz */
  function setStateFiz(bytes32 key, bool stateFiz) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((stateFiz)));
  }

  /** Set stateFiz (using the specified store) */
  function setStateFiz(IStore _store, bytes32 key, bool stateFiz) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((stateFiz)));
  }

  /** Get position */
  function getPosition(bytes32 key) internal view returns (bool position) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get position (using the specified store) */
  function getPosition(IStore _store, bytes32 key) internal view returns (bool position) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set position */
  function setPosition(bytes32 key, bool position) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((position)));
  }

  /** Set position (using the specified store) */
  function setPosition(IStore _store, bytes32 key, bool position) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((position)));
  }

  /** Get stateLoc */
  function getStateLoc(bytes32 key) internal view returns (string memory stateLoc) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (string(_blob));
  }

  /** Get stateLoc (using the specified store) */
  function getStateLoc(IStore _store, bytes32 key) internal view returns (string memory stateLoc) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (string(_blob));
  }

  /** Set stateLoc */
  function setStateLoc(bytes32 key, string memory stateLoc) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 4, bytes((stateLoc)));
  }

  /** Set stateLoc (using the specified store) */
  function setStateLoc(IStore _store, bytes32 key, string memory stateLoc) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 4, bytes((stateLoc)));
  }

  /** Get the length of stateLoc */
  function lengthStateLoc(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of stateLoc (using the specified store) */
  function lengthStateLoc(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of stateLoc (unchecked, returns invalid data if index overflows) */
  function getItemStateLoc(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of stateLoc (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemStateLoc(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to stateLoc */
  function pushStateLoc(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 4, bytes((_slice)));
  }

  /** Push a slice to stateLoc (using the specified store) */
  function pushStateLoc(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 4, bytes((_slice)));
  }

  /** Pop a slice from stateLoc */
  function popStateLoc(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 4, 1);
  }

  /** Pop a slice from stateLoc (using the specified store) */
  function popStateLoc(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 4, 1);
  }

  /** Update a slice of stateLoc at `_index` */
  function updateStateLoc(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)));
  }

  /** Update a slice of stateLoc (using the specified store) at `_index` */
  function updateStateLoc(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (GridBolidData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (GridBolidData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 key,
    address playerRef,
    bool stateMind,
    bool stateFiz,
    bool position,
    string memory stateLoc
  ) internal {
    bytes memory _data = encode(playerRef, stateMind, stateFiz, position, stateLoc);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 key,
    address playerRef,
    bool stateMind,
    bool stateFiz,
    bool position,
    string memory stateLoc
  ) internal {
    bytes memory _data = encode(playerRef, stateMind, stateFiz, position, stateLoc);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, GridBolidData memory _table) internal {
    set(key, _table.playerRef, _table.stateMind, _table.stateFiz, _table.position, _table.stateLoc);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, GridBolidData memory _table) internal {
    set(_store, key, _table.playerRef, _table.stateMind, _table.stateFiz, _table.position, _table.stateLoc);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (GridBolidData memory _table) {
    // 23 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 23));

    _table.playerRef = (address(Bytes.slice20(_blob, 0)));

    _table.stateMind = (_toBool(uint8(Bytes.slice1(_blob, 20))));

    _table.stateFiz = (_toBool(uint8(Bytes.slice1(_blob, 21))));

    _table.position = (_toBool(uint8(Bytes.slice1(_blob, 22))));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 23) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 55;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.stateLoc = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    address playerRef,
    bool stateMind,
    bool stateFiz,
    bool position,
    string memory stateLoc
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(bytes(stateLoc).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(playerRef, stateMind, stateFiz, position, _encodedLengths.unwrap(), bytes((stateLoc)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
