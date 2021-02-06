// SPDX-License-Identifier: MIT
pragma solidity >=0.4.2;





contract Election {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write Candidates
    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;
    
    uint public candidatesCount;

    // Constructor
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }   

    function vote(uint _candidateID) public {
        require(!voters[msg.sender]);
        require(_candidateID > 0 && _candidateID <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateID].voteCount ++;              
    }

}
