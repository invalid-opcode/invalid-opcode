pragma solidity ^0.4.17;

contract InvalidOpcode {
  // Props

  uint public timelock;
  int public defaultRep;

  //

  constructor(uint _timelock, uint _defaultRep) {
    timelock = _timelock;
    defaultRep = _defaultRep;
  }

  // Structs

  struct Question {
    string question_string;
    address asker;
    int bounty;
    int[] answers;
  }

  struct Answer {
    string answer_string;
    address answerer;
    uint question_id;
    uint128 upvotes;
    uint128 downvotes;
  }

  struct User {
    bool is_active;
    int reputation;
  }

  
  // Storage
  Question[] public questions;
  Answer[] public answers;

  mapping(address => User) users;


  function postQuestion() public {

  }

  function addBounty() public {

  }

  function postAnswer() public {

  }

  function upVote() public {

  }

  function downVote() public {

  }

  function claimBounty() public {


  }

  function _setIsActive(address user) internal {
    if (!users[user].is_active) {
      users[user].is_active = true;
      users[user].reputation = defaultRep;
    }
   }
}