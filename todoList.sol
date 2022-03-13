//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract todoList {
    uint public taskCount; //To keep count of remaining tasks
    uint public totalTasks; //To keep count of total tasks and mapping

    struct task {
        uint id;
        string taskName;
        bool completed; //0 -> completed ; 1-> not completed
    }

    //To Map tasks as a key-value pair
    mapping (uint => task) public tasks;

    //Task Creation Event
    event taskCreated (
        uint id,
        string taskName,
        bool completed
    );
    
    //Task Completion Event
    event taskCompleted (
        uint id,
        bool completed
    );

    function createTask (string memory _taskName) public {
        totalTasks ++;
        taskCount ++;
        tasks[totalTasks] = task(totalTasks, _taskName, false);
        emit taskCreated(totalTasks, _taskName, false);
    }

    function completedTask (uint _id) public {
        taskCount --;
        task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit taskCompleted(_id, _task.completed);
    }
}