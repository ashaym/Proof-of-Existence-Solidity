pragma solidity ^0.4.21;

/// @title A contract to simulate Proof of Existence of a FileDetails
/// @author Ashay Maheshwari

contract ProofOfExistence{
    
    struct FileDetails{
        uint timestamp;
        string owner;
    }
    
    mapping(string => FileDetails) fileMapHash;
    
    event LogSetFileDetails(bool status, 
        string owner, 
        uint timestamp, 
        string fileHash);
    
    function setFileDetails(string _fileHash, string _owner) public {
        
        if(fileMapHash[_fileHash].timestamp == 0){
            //The file doesnt exist in the system, record the details
            fileMapHash[_fileHash] = FileDetails(block.timestamp,_owner);
            emit LogSetFileDetails(true,_owner,block.timestamp,_fileHash);
        }
        else{
            //file is already recorded in the system
            emit LogSetFileDetails(false,_owner,fileMapHash[_fileHash].timestamp,_fileHash);
        }
            
    }
    
    
    function getFileDetails(string _fileHash) public view returns (uint timestamp, string owner){
        //get the file details
        return(fileMapHash[_fileHash].timestamp, fileMapHash[_fileHash].owner);
        
    }
}
