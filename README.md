# ACF
Abercrombie & Fitch Code Test
 The Explore tabs on the A&F mobile apps are the central landing experiences for the A&F mobile shoppers. These views allow shoppers to scroll through promotions, product recommendations, and featured categories. The goal of this exercise is to recreate a subset of those requirements and generate promotion cards similar to the ones shown on our Explore pages today. Below is an example of one of these product cards.
Requirements:
- Submissions should be wrapped in a zip file and returned upon completion.
- The app should launch to a scrollable view that can display zero or more
product cards
- Product cards should appear in the same order that they are displayed in the
feed.
- The above card is representing all of the possible data fields. If a data field is
empty then the card should resize to omit the space from the card. (See the Explore tab of our active apps for an example of how these cards can be resized)
- The JSON feed should be download at app launch from
https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_explo
reData.json
- Selecting a button such as Shop Men or Shop Women should present the user with a web view that displays the URL content
- At A&F we strive for a high level of unit test coverage. Show us that you know how to unit test your code
- Third party frameworks are sometimes necessary. If you feel like this project will benefit from the incorporation of a third party feel free to use it.
   
Abercrombie & Fitch Code Test
  JSON Data:
1. backgroundImage
a. The size of this can vary and the Image view should change size based on the size of the image provided.
b. You can assume that image will always be the full width of the product card
2. topDesccription
a. Font Size: 13
3. title
a. Font Size: 17 (BOLD)
4. promoMessage
a. Font Size: 11
5. bottomDescription
a. Font Size: 13
6. content
a. Can contain zero or more Items. Each item in the list should be represented by a button
i. Title
1. Font Size: 15
ii. Target
1. The URL the button should link the user to
