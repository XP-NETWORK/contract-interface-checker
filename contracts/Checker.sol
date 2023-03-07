//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.17;

// Access
// import "@openzeppelin/contracts/access/IAccessControl.sol";
// import "@openzeppelin/contracts/access/IAccessControlEnumerable.sol";

// Governance
// import "@openzeppelin/contracts/governance/IGovernor.sol";
// import "@openzeppelin/contracts/governance/compatibility/IGovernorCompatibilityBravo.sol";

// token
// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
// import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

// proxy
// import "@openzeppelin/contracts/proxy/beacon/IBeacon.sol";

// interfaces
// import "@openzeppelin/contracts/interfaces/IERC1155MetadataURI.sol";
// import "@openzeppelin/contracts/interfaces/IERC20Metadata.sol";

// import "@openzeppelin/contracts/interfaces/IERC2981.sol"; // royalty info
// import "@openzeppelin/contracts/interfaces/IERC721Enumerable.sol"; 
// import "@openzeppelin/contracts/interfaces/IERC721Receiver.sol"; 

import "@openzeppelin/contracts/interfaces/IERC165.sol";

// Velas: 0xaB9eD7b9734471249255B4d969B32995015116d9

contract ContractChecker {

    error NotContract(address _addr);

    string[] private Interfaces = [
        "AccessControl",
        "AccessControlEnumerable",
        "Governor",
        "GovernorCompatibilityBravo",
        "ERC20",
        "ERC20Metadata",
        "ERC721",
        "ERC1155",
        "ERC1155MetadataURI",
        "Beacon",
        "ERC165",
        "ERC2981",
        "ERC721Enumerable",
        "ERC721Receiver"
    ];

    bytes4[] private InterfaceHashes = [
        bytes4(0x7965db0b),
        0x5a05180f,
        0x79dd796f,
        0x4cba6a08,
        0x36372b07,
        0xa219a025,
        0x80ac58cd,
        0xd9b67a26,
        0x0e89341c,
        0x5c60da1b,
        0x01ffc9a7,
        0x2a55205a,
        0x780e9d63,
        0x150b7a02
    ];

    event SupportsInterface(address _addr, bytes4 _interface, string name);

    constructor() {}

    function whatInterface(address _addr) public {
        // Chech whether we're dealing with a contract
        if(!isContract(_addr)){revert NotContract(_addr);}

        for(uint8 i=0; i<Interfaces.length;i++){
            if(IERC165(_addr).supportsInterface(InterfaceHashes[i])){
                emit SupportsInterface(_addr, InterfaceHashes[i], Interfaces[i]);
            }
        }
    }


    function isContract(address _addr) public view returns (bool isContr) {
        assembly {
            let size := extcodesize(_addr)
            isContr := gt(size, 0)
        }
    }

    // function getSignatures() external pure returns(bytes4 memory) {
    //     // Getting a selector of an interface:
    //     return bytes4(type(IERC165).interfaceId);
    // }

}
