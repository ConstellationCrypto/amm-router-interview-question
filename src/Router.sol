// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title Router (Starter)
 * @notice Register undirected token pairs with pool addresses. Find the minimum-hop distance between tokens.
 *
 */
contract Router {
    error InvalidToken();
    error InvalidPool();
    error DuplicatePair();
    error RouteNotFound();

    event PoolAdded(address indexed tokenA, address indexed tokenB);


    function addPool(address tokenA, address tokenB) external {
        tokenA; tokenB;
        revert("TODO");
    }

    /// @notice Return the fewest hops (pools) between src and dst.
    /// @dev Revert RouteNotFound() if unreachable.
    function findHops(address src, address dst) external pure returns (uint256 hops) {
        src; dst;
        revert("TODO");
    }
}
