pragma solidity ^0.4.17;


contract InvalidOpcode {
  // Props
event questionPosted();

  uint public timelock;
  int public defaultRep;

  //

  constructor(uint _timelock, int _defaultRep) {
    timelock = _timelock;
    defaultRep = _defaultRep;
  }

  // Structs

  struct Question {
    string question_string;
    address asker;
    uint bounty;
    uint[] answers;
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


  function postQuestion(string _q) payable public {
    Question memory q;
    q.question_string= _q;
    q.asker = msg.sender;
    q.bounty =  msg.value;
    questions.push(q);
  }

  function addBounty() payable public {

  }

  function postAnswer(uint _questionID, string answer) public {

  }

  function upVote(uint _answerID) public {

  }

  function downVote(uint _answerID) public {

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
