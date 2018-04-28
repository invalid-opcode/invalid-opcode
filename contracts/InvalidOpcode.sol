pragma solidity ^0.4.17;

event questionPosted();

contract InvalidOpcode {
  // Props

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
  
  // Storage
  Question[] public questions;
  Answer[] public answers;

  
  struct User {
    bool is_active;
    int reputation;
  }

  mapping(address => User) users;

  function postQuestion(string _question) public payable {
    questions.push(_question);

  }

  function addBounty(uint _questionID) public payable {
    questions[_questionID].ethValue = msg.value;
  }

  function postAnswer(uint _questionID, string answer) public {

  }

  function upVote(uint _answerID) public {

  }

  function downVote(uint _answerID) public {

  }


  int256 constant INT256_MIN = int256((uint256(1) << 255));
  
  function claimBounty(uint _questionID) public {
    // Load Question
    Question storage q = questions[_questionID];

    // Check if already paid out and that timelock satisfied
    //require(q.paid == False);
    //require(timelock
    
    // iterate to find winning answer?
    // this sucks, but for just for today.
    uint best_index = 0;
    int best_value = INT256_MIN;
    uint arraylength = q.answers.length;
    for (uint i=0; i<arrayLength; i++) {
        Answer storage tmp_a = answers[q.answers[i]];
	int score = tmp_a.upvotes - tmp_a.downvotes;
	if (score > best_value) {
	  best_index = i;
	  best_value = score;
	}
    }

    // Check this is being called by the correct answerer
    Answer storage a = answers[q.answers[best_index]];
    require(msg.sender == a.answerer);

    // Flag paid first to prevent reentrancy, then pay.
    q.paid == True;
    msg.sender.transfer(q.bounty);
    }
      
      

  }

  function _setIsActive(address user) internal {
    if (!users[user].is_active) {
      users[user].is_active = true;
      users[user].reputation = defaultRep;
    }
   }
}
