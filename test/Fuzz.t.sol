pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract SimpleMath {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}

contract SimpleMathTest is Test {
    SimpleMath simpleMath;

    function setUp() public {
        simpleMath = new SimpleMath();
    }

    function testFuzz_CommutativeAddition(uint256 a, uint256 b) public {
        uint256 sum1 = simpleMath.add(a, b);
        uint256 sum2 = simpleMath.add(b, a);
        assertEq(sum1, sum2);
    }

    function testFuzz_SumGreaterOrEqual(uint256 a, uint256 b) public {
        uint256 sum = simpleMath.add(a, b);
        assertTrue(sum >= a && sum >= b);
    }

    function testFuzz_PositiveAddition(uint96 a, uint96 b) public {
        vm.assume(a > 0 && b > 0);
        uint256 sum = simpleMath.add(a, b);
        assertTrue(sum > 0);
    }
}
