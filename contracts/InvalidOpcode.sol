pragma solidity ^0.4.17;

event questionPosted();

contract InvalidOpcode {

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

  function claimBounty() public {

  }


}
