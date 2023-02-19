// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;



import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";



contract Stake is ERC20 {



    address payable public owner;



    address payable public icz;



    uint256 private sendAmount;



    mapping (address => uint256) public stakedAmount;



    mapping (address => bool) private active;

    

    mapping (address => uint256) public releaseDeposit;



    mapping (address => uint256) public lastGot;



    constructor() ERC20("Stake", "sICZ") {

        owner = payable(msg.sender);

        icz = payable(0x5424921e69d2e891F7Da0750349A878E69Dd9374);

    }



    /* Administrator functions.

       * In case of emergency, save tokens from pool.

    */



    function withdrawOwner(address recipient, uint256 amount) public {

        require(msg.sender == owner, "You are not owner");

         IERC20(icz).transfer(recipient, amount);

    }



    /* User functions.

       * Add tokens to stake and win montly.

       * Get profit montly, and withdraw amount invested one year later.

    */



    function depositUser(uint256 amount) public {

        require(false == active[msg.sender], "Stake already active"); 

        require(amount > 0, "You must deposit a positive amount");

        require(msg.sender != address(0), "Cannot send from zero address");

        uint256 senderBalance = IERC20(icz).balanceOf(msg.sender);

        require(senderBalance > 0, "Insuficient balance");

        stakedAmount[msg.sender] = amount;

        releaseDeposit[msg.sender] = block.timestamp + 360 days;    

        lastGot[msg.sender] = block.timestamp + 30 days;   



        active[msg.sender] = true;

    }



    function withdrawUser() public {

        require(true == active[msg.sender], "User isnt active");

        require(block.timestamp <= releaseDeposit[msg.sender], "Time its over");

        require(block.timestamp >= lastGot[msg.sender], "It has not been 30 days"); 

        uint256 gain = (stakedAmount[msg.sender] * 3) / 100;

        lastGot[msg.sender] = block.timestamp + 30 days;   

        IERC20(icz).transfer(msg.sender, gain);

    }



    function withdrawInvest() public {

        require(true == active[msg.sender], "User isnt active"); 

        require(block.timestamp >= releaseDeposit[msg.sender], "It has not been 360 days since the first deposit");       

        uint256 amount = stakedAmount[msg.sender];



        IERC20(icz).transfer(msg.sender, amount);

        stakedAmount[msg.sender] = 0;

        active[msg.sender] = false;



    }



    /* Tools functions.

       * Add tokens to stake and win montly.

       * Get profit montly, and withdraw amount invested one year later.

    */



    function contractBalance() public view returns (uint) {

        return IERC20(icz).balanceOf(address(this));

    }



    function globalBalance(address user) public view returns (uint) {

        return IERC20(icz).balanceOf(user); 

    }



    function itActive(address signer) public view returns (bool) {

        active[signer];

    }

}



