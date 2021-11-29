// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract EpicNFT is ERC721URIStorage {
	// Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;


	string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";


	string[] public firstWords = ["Faye", "Valentine", "Cowboy", "Bebop", "Spike", "Jet"];
	string[] public secondWords = ["Quesadilla", "Chimichanga", "SweetPork", "Oatmeal", "Pizza", "YOUR_WORD"];
	string[] public thirdWords = [" GM", "Dao", "Bzzz", "Eating", "Sleeping", "Nothing"];

  // We need to pass the name of our NFTs token and it's symbol.
  constructor() ERC721 ("SquareNFT", "SQUARE") {
		console.log("This is my epic NFT contract.");
  }


	function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
		uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));

		rand = rand & firstWords.length;
		return firstWords[rand];
	}


  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
		
		// Get the current tokenId, this starts at 0.
		uint256 newItemId = _tokenIds.current();

		// Actually mint the NFT to the sender using msg.sender.
		_safeMint(msg.sender, newItemId);

	// Generate NFT random data.



		// Set the NFTs data.
		_setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiRXBpY0xvcmRIYW1idXJnZXIiLAogICAgImRlc2NyaXB0aW9uIjogIkFuIE5GVCBmcm9tIHRoZSBoaWdobHkgYWNjbGFpbWVkIHNxdWFyZSBjb2xsZWN0aW9uIiwKICAgICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhkb2FYUmxPeUJtYjI1MExXWmhiV2xzZVRvZ2MyVnlhV1k3SUdadmJuUXRjMmw2WlRvZ01UUndlRHNnZlR3dmMzUjViR1UrQ2lBZ0lDQThjbVZqZENCM2FXUjBhRDBpTVRBd0pTSWdhR1ZwWjJoMFBTSXhNREFsSWlCbWFXeHNQU0ppYkdGamF5SWdMejRLSUNBZ0lEeDBaWGgwSUhnOUlqVXdKU0lnZVQwaU5UQWxJaUJqYkdGemN6MGlZbUZ6WlNJZ1pHOXRhVzVoYm5RdFltRnpaV3hwYm1VOUltMXBaR1JzWlNJZ2RHVjRkQzFoYm1Ob2IzSTlJbTFwWkdSc1pTSStSbUZxYVhSaGMxRjFaWE5oWkdsc2JHRnpRMmhwYldsamFHRnVaMkZ6UEM5MFpYaDBQZ284TDNOMlp6ND0iCn0=");
		console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

		// Increment the counter for when the next NFT is minted.
		_tokenIds.increment();
  }
}
