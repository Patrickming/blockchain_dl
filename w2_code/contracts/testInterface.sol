pragma solidity ^0.8.0;

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);
    function increment() external;
}

contract MyContract {
    //往常是这样 这样的话就得有所有Counter的东西  gas 34673
     function incrementCounter(Counter counter) external {
        counter.increment();
    }
    //这样的话就只需要我们接口定义的方法 而不是Counter所有的东西 想用什么在接口定义就好了 gas 34573
    function incrementCounter2(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}