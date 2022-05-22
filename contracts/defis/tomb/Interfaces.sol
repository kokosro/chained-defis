// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITombMasonary {
    struct Masonseat {
        uint256 lastSnapshotIndex;
        uint256 rewardEarned;
        uint256 epochTimerStart;
    }
    
    struct MasonrySnapshot {
        uint256 time;
        uint256 rewardReceived;
        uint256 rewardPerShare;
    }

    function withdrawLockupEpochs() external view returns(uint256);
    function rewardLockupEpochs() external view returns(uint256);
    function latestSnapshotIndex() external view returns (uint256) ;

    function getLastSnapshotIndexOf(address mason) external view returns (uint256);

    function canWithdraw(address mason) external view returns (bool);

    function canClaimReward(address mason) external view returns (bool);

    function epoch() external view returns (uint256);

    function nextEpochPoint() external view returns (uint256);

    function getTombPrice() external view returns (uint256);

    function rewardPerShare() external view returns (uint256);

    function earned(address mason) external view returns (uint256);

    function stake(uint256 amount) external;

    function withdraw(uint256 amount) external;

    function exit() external;

    function claimReward() external;

    function share() external view returns(address);
    function tomb() external view returns(address);
    function treasury() external view returns(address);
    function totalSupply() external view returns(uint256);
    function balanceOf(address mason) external view returns(uint256);
    
}

interface ITombTreasury {

    function PERIOD() external view returns(uint256);
    function operator() external view returns(address);
    function initialized() external view returns(bool);

    // epoch
    function startTime() external view returns(uint256);
    function epoch() external view returns(uint256);
    function epochSupplyContractionLeft() external view returns(uint256);

    // core components
    function tomb() external view returns(address);
    function tbond() external view returns(address);
    function tshare() external view returns(address);

    function masonry() external view returns(address);
    function tombOracle() external view returns(address);

    // price
    function tombPriceOne() external view returns(uint256);
    function tombPriceCeiling() external view returns(uint256);

    function seigniorageSaved() external view returns(uint256);

    function supplyTiers(uint256) external view returns(uint256);
    function maxExpansionTiers(uint256) external view returns(uint256);

    function maxSupplyExpansionPercent() external view returns(uint256);
    function bondDepletionFloorPercent() external view returns(uint256);
    function seigniorageExpansionFloorPercent() external view returns(uint256);
    function maxSupplyContractionPercent() external view returns(uint256);
    function maxDebtRatioPercent() external view returns(uint256);

    // 28 first epochs (1 week) with 4.5% expansion regardless of TOMB price
    function bootstrapEpochs() external view returns(uint256);
    function bootstrapSupplyExpansionPercent() external view returns(uint256);

    /* =================== Added variables =================== */
    function previousEpochTombPrice() external view returns(uint256);
    function maxDiscountRate() external view returns(uint256); // when purchasing bond
    function maxPremiumRate() external view returns(uint256); // when redeeming bond
    function discountPercent() external view returns(uint256);
    function premiumThreshold() external view returns(uint256);
    function premiumPercent() external view returns(uint256);
    function mintingFactorForPayingDebt() external view returns(uint256); // print extra TOMB during debt phase

    function daoFund() external view returns(address);
    function daoFundSharedPercent() external view returns(uint256);

    function devFund() external view returns(address);
    function devFundSharedPercent() external view returns(uint256);

    /* =================== Events =================== */

    event Initialized(address indexed executor, uint256 at);
    event BurnedBonds(address indexed from, uint256 bondAmount);
    event RedeemedBonds(address indexed from, uint256 tombAmount, uint256 bondAmount);
    event BoughtBonds(address indexed from, uint256 tombAmount, uint256 bondAmount);
    event TreasuryFunded(uint256 timestamp, uint256 seigniorage);
    event MasonryFunded(uint256 timestamp, uint256 seigniorage);
    event DaoFundFunded(uint256 timestamp, uint256 seigniorage);
    event DevFundFunded(uint256 timestamp, uint256 seigniorage);

    /* =================== Modifier =================== */

    function isInitialized() external view returns (bool);

    // epoch
    function nextEpochPoint() external view returns (uint256);

    // oracle
    function getTombPrice() external view returns (uint256 tombPrice);

    function getTombUpdatedPrice() external view returns (uint256);

    // budget
    function getReserve() external view returns (uint256);

    function getBurnableTombLeft() external view returns (uint256 _burnableTombLeft);

    function getRedeemableBonds() external view returns (uint256 _redeemableBonds);

    function getBondDiscountRate() external view returns (uint256 _rate);

    function getBondPremiumRate() external view returns (uint256 _rate);

    /* ========== GOVERNANCE ========== */

    
    function getTombCirculatingSupply() external view returns (uint256);

    function buyBonds(uint256 _tombAmount, uint256 targetPrice) external;

    function redeemBonds(uint256 _bondAmount, uint256 targetPrice) external;

    function allocateSeigniorage() external;
    

}
