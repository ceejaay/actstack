Act Stack
=========

  1. The first thing you should see when you get to this page is a list of premises.
    - The premises are arranged by upvotes.
    - ✓A way to make a new premise.
    - ✓You should be able to link to each premise.
    - ✓You will be able to see the acts when you click on the premise.
      - ✓when you look at the show premise page you'll see a list of acts
      - ✓You can upvote the acts

Things to Do:
------------
  1. ✓upvotes on acts
  2. Limits on the acts and premise.
    - Premise 140 char
    - Act1 150 words.
    - Act2 300 words
    - Act3 150 words
  3. Restrict blank entries
  4. flash messages alerting user to a problem with entries.
  5. Show top three acts on show premise page.
    - show a list of other acts, in descending order of votes on side of page.
  6. Show the premises in descending order by votes.
  7. Be able to tweet premise with link to the actual story.
  8. Ability to fork the premise and acts.
  9. A system to keep track of stuff. Somekind of non-login system. Like the Chans.
    - research tripcodes
    - [tripcodes](https://en.wikipedia.org/wiki/Imageboard#Tripcodes)
    - There needs to be clear instructions on how the tripcodes work.
  10. All the html and css stuff. Haz to make it look good/ok.
  11. The upvote systems is probably broken. Probably should research and fix it.
  12. Needs a captcha system to keep out bots and spam.
  13. A flagging system to keep out spam and bad content.

Click on a premise
-----------------

  1. The premise page will show the premise
    - Below it will be the three top voted acts from each category.
      - Act 1, Act 2, Act 3 etc.

  2. Off to the side you'll see all the other acts.
    - They are color coded.
        - Green for first act.
        - Orange for second act
        - Red for third act
    - in descending order of votes.

Write your own acts.
-------------------

  1. You can write your own acts
    - There will be three buttons to go to a 'new act' page.
      - These are all connecte to the premise page you are on.
        - You can't have an act without a premise.

  2. The 'New Act' page has a blank field a save button and a character counter.
    - You can only write an act with 140 characters.
    - Writing an act takes you back to the show premise page.
     - You can see the act you just wrote at the top.
     - You can drag it into the lineup so you can  look at it with the other acts.

Database Schema
---------------
  1. Premise
    - author
    - text or content
    - time created
    - email or other identifying data so the author can edit or something.
    - upvotes
    - time edited

  2. Acts
    - author
    - text or content
    - the premise it belongs to
    - time created
    - email or other info for the author to edit or delete.
    - ???

Shuffling acts
--------------

  1. On the Premise page you can shuffle acts.
    - Using javascript you can move the around.
      - acts designated by act three two or one stay their original color.
  2. The three acts can be drug around.
    - You can place them in whatever order you want.
    - There's no saving. Just move them around.
    - You can tweet them when you are done.
  3. How will we see the way you shifted the acts around?
    - ~~User log in?~~
    - Some kind of unique link?
    - Not sure how to do this.

Random Ideas
-----------
  - I think we'll have 150 words for first and third act. Then 300 words for second act.
  - There will be no accounts. You get an e-mail if you want to go back and edit your act or premise.
  - You can tweet the three acts simultaneneously
  - You can log in as a user and edit your own acts.
  - You can have revisions of one act based on another person's act that they have written.
    - Kind of like forking the act.
  - Fork the premise too.
  - Why would you have upvotes if you want to switch them around?
  - Maybe just the premises could just have upvotes?
