// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {Router} from "../src/Router.sol";

contract RouterCandidateTest is Test {
    Router router;

    address A = address(0xA1);
    address B = address(0xB2);
    address C = address(0xC3);
    address D = address(0xD4);
    address E = address(0xE5);

    function setUp() public {
        router = new Router();
    }

    function _seed() internal {
        router.addPool(A, B);
        router.addPool(B, C);
        router.addPool(C, D);
        router.addPool(C, E);
        router.addPool(B, E);
    }

    function test_SelfRoute() public {
        _seed();
        assertEq(router.findHops(A, A), 0);
    }

    function test_DirectEdge() public {
        _seed();
        router.addPool(A, D);
        assertEq(router.findHops(A, D), 1);
    }

    function test_IndirectFewest() public {
        _seed();
        assertEq(router.findHops(A, D), 3);   // A-B-C-D
        assertEq(router.findHops(A, E), 2);   // A-B-E
    }

    function test_Unreachable() public {
        _seed();
        address X = address(0xDEAD);
        vm.expectRevert();
        router.findHops(A, X);
    }
}
