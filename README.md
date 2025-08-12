# Interactive-Wiki
This is an interactively built wiki application for stories that uses NLP for finding and curating information within a story based on user request.

I will sometimes be looking at an item, character, or place and wandering where it has been talked about before in a story.

So often something like Google will work for a story that is a big main stream hit with a really well maintained wiki but not for smaller stories without all that community work being done for them. Not to mention the issue that Google and the wikis don't have great protections based on where you currently are at for sanitizing your search results of spoilers while adding all the useful information up to the point you have reached.

A custom NLP pipeline is being made here so that the resource usage is low and novel data won't be sent to a big model for training and instead only kept locally with the user.

things to search
  - characters
  - places
  - objects
  - events
  - tech and/or magic and/or special techniques etc.

- feature study: character search
    - prompt user
        - search subject: character, name
        - search range: chapter range to search between
    - systems
        - initial content scrape: scrape content from RoyalRoad in scrape range
        - appearances search: find all chapters and scenes where the search subject appears
            - appearance types:
                - subject relation to mention
                    - subject directly in scene w/ the mention
                    - subject not in scene w/ the mention
                - mention directness
                    - mentioned by name
                    - never mentioned by name, think alias and person who did so and so
            - capture name of chapter and scene, also select block of text to be that scene
        - connection searches: find things connected to the search subject within the search range
            - characters
            - places
            - objects
            - events
            - tech and/or magic and/or special techniques etc.
    - UI
        - initial search prompt
        - appearances result
        - connections results

Potentially this could expand to have functionality like the everything page demonstrated by LiveOverflow where based on user interaction there is always more content or in the case here another item to wiki search.
