pragma solidity ^0.4.17;

contract InvalidOpcode {


  function InvalidOpcode() public {
  
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

  }

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

  function claimBount() public {


  }


}
