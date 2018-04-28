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
    bool paid;
    uint created_block;
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

  mapping (address => mapping(uint /* qID */ => mapping(uint /* aId */ => bool))) voted;

   event questionPosted(string userQuestion, address questionAsker);
   event bountyAdded(uint _questionID, uint _value);

  function postQuestion(string _q) payable public {
    _setIsActive(msg.sender);
    Question memory q;
    q.question_string= _q;
    q.asker = msg.sender;
    q.bounty =  msg.value;
    questions.push(q);
    questionPosted(_q ,msg.sender);
  }

  function addBounty(uint _questionID) public payable {
    questions[_questionID].bounty += msg.value;
    emit bountyAdded(_questionID, msg.value);
  }

  function postAnswer(uint _questionID, string answer) public {

  }

  function upVote(uint _answerID) public {
  }

  function downVote(uint _answerID) public {
    if(voted[msg.sender][answers[_answerID].question_id][_answerID]) {
      answers[_answerID].downvotes += 1;
      _setVoted(msg.sender, answers[_answerID].question_id, _answerID);
    }
  }


  int256 constant INT256_MIN = int256((uint256(1) << 255));
  
  function claimBounty(uint _questionID) public {
    // Load Question
    Question storage q = questions[_questionID];

    // Check if already paid out and that timelock satisfied
    require(q.paid == false);
    require(q.created_block + timelock < block.number);
    
    // iterate to find winning answer?
    // this sucks, but for just for today.
    uint best_index = 0;
    int best_value = INT256_MIN;
    uint arraylength = q.answers.length;
    for (uint i=0; i<arraylength; i++) {
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
    q.paid == true;
    msg.sender.transfer(q.bounty);
    }

  function _setVoted(address _voter, uint _qId, uint _aId) internal {
    voted[_voter][_qId][_aId] = true;
  }

  function _setIsActive(address user) internal {
    if (!users[user].is_active) {
      users[user].is_active = true;
      users[user].reputation = defaultRep;
    }
   }
}
