pragma solidity ^0.4.17;

contract InvalidOpcode {

  // Structs

  struct Question {

  }

  struct Answer {
    bool z;

  }

  
  // Storage
  Question[] public questions;
  

  function postQuestion(string _question) public payable {
    questions.push(_question);
  }

  function addBounty(uint _questionID) public payable {
    questions[_questionID].ethValue = msg.value;
  }

  function postAnswer() public {
    
  }

  function upVote() public {

  }

  function downVote() public {

  }

  function claimBount() public {


  }


}
