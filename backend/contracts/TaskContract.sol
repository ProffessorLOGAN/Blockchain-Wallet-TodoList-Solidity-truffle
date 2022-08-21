// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract TaskContract {
 event AddTask(address recipient, uint taskId)
 event DleteTask(uint taskId, bool isDeleted)

struct Task{
  uint id;
  string taskText;
  bool isDeleted;
}

Task[] private tasks;
mapping(uint256 => address) taskToOwner;

function addTask(string memory taskText, bool isDeleted)
external{
  unit taskId = tasks.lenght;
  tasks.push( Task(taskId ,taskText , isDeleted) )
  taskToOwner[taskId] = msg.sender;
  emit AddTask(msg.sender , taskId);
}

function getMyTasks() external view returns (Task[] memory){
  Task[] emorytemporary = new Task[](tasks.length);
  unit counter = 0;


for( unit i=0; i<tasks.lenght; i++){
  if(taskToOwner[i] == msg.sender && tasks[i].isDeleted == false){
    temporary[counter] = tasks[i];
    counter++;

  }
}

Task[] memory result = new Task[](counter);
for(uint i=0; i<counter; i++){
  result[i] = temporary[i];
}
return result;
}


}
