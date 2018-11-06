pragma solidity ^0.4.25;

contract VisitorsLog{

uint logCount = 0;

/* Create Struct */ 

struct Guest{
    string _note;
    string _name;
    uint _time;
    address _SenderAddress;
}

// Define Guest in GuestBook 
Guest[] public GuestBook;

// Push Guest to GuestBook 
// string, message.address, now 

    function Write(string note, string name) public returns (string){
        GuestBook.push(Guest(note, name, now, msg.sender));
        return note;
    }

// Public view GuestBook. 
/*
    function Read(uint ID) public view returns(string, string, uint, address){
    return GuestBook[ID];
    }
*/    
}


contract VisitorLogMap{
    
    // VisitorLog using mappings
    
    event broadcast(string);
    
    uint public logCount = 0;
    
    struct Guest{
        string _note;
        string _name;
        uint _blocknumber;
        address _address;
    }
    
    mapping (uint => Guest) GuestLog;
    
    function Write(string Note, string Name) public returns(string){
        require(bytes(Note).length != 0);
        require(bytes(Name).length != 0);
        logCount++;
        GuestLog[logCount] = Guest(Note, Name, block.number, msg.sender);
        return('Thank you!');
        emit broadcast('New submission!');
    }
    
    function Read(uint Entry_Number) public view returns(string, string, uint, address){// Can you return struct?{
        return(GuestLog[Entry_Number]._note,GuestLog[Entry_Number]._name,GuestLog[Entry_Number]._blocknumber,GuestLog[Entry_Number]._address);
    }
    
    //gotta get this to work
    function viewAll() public view returns(string, string, uint, address){
        for(uint i = 1; i <= logCount; i++){
            return(Read(i));
        }
    }
}
