---
title: Thoughts about teaching programming to elementary students
output:
  html_document:
    keep_md: yes
---
# Thoughts about teaching programming to elementary students

# Prerequisites

There are some computer literacy skills unrelated to programming that ideally are learned before the kids get into a classroom.  In my mind, these are things that a parent can teach them at home, and allow them to have gentle & unrushed practice a few weeks/months before they see a programming language.

This is in approximate order of difficulty.

1. Send short, silly emails to a grandparent.  This stage's content can be full of typos. Ideally the recipient is using a different computer, and in a different house (or at least a different room).  I like grandparents for this role, because it's more likely to feel like fun, and not a technical lesson.  

    A few dozen of these should help them make the connection that the content they write is somehow processed and moved by a computer.  And that hitting execute/send initiate a chain of automated events.  This seems like an important jump from writing the exact same sentences with pen & paper.  At this stage, hen pecking is fine for typing.
    
    I think IM might be better than email (maybe even embedded in a Skype or Google Hangout session), if the recipient is comfortable with it.  IM's immediacy is better, but I like how they can review previous emails the next time they start the computer.  Maybe a mix of both is best.

    Whoever the recipient is, they should be tolerant of irritating wastes of time.  ...wasters such as 15 successive emails consisting of nothing but 200 repetitions of 'jkl;sdafljk;dsfa;ewr', because the kid wants to see what happens when the 'words' get to the bottom of the page (because last time was so cool, and it might be different this time).  My guess is that most grandparents will respond more positively than the parents late to pick up their other kid from a music lesson.  As irritating as these emails are, the kid shouldn't be discouraged from nonsense because they're (a) learning [GUI](http://en.wikipedia.org/wiki/Graphical_user_interface) behaviors and metaphors, (b) getting it out of their system before they get to a programming lesson, and (c) having fun for some stupid reason.
  
1. Be comfortable typing, with proper hand positions & mechanics.  We used a free kid-oriented program in Linux (eg, [Tux Typing](http://en.wikipedia.org/wiki/Tux_Typing)).  I'm sure there are lots of these for each OS.  Ideally it has a phase where it teaches which keys are hit by which fingers, and another game-like phase (eg, the kid has to type a word before it falls to earth).

1. Write longer emails to a grandparent.  These should be mistake-free by the time it's sent.  It doesn't have to be serious, but it should be long enough that they learn to
    * Recognize typos, and correct them.
    * Navigate with a keyboard (not just a mouse/touchpad).  Be comfortable using arrows keys, page up/down, home/end.
    * Select, copy, & paste (both with a mouse selecting and right-clicking, and with the keys selecting and ctrl+c & ctrl+v).
    * Moving, resizing, & closing windows within the operating system.

    I don't know how to prompt the following naturally, but I think it's important.  They should get practice moving around content (eg, rearranging the words within a sentence, or the sentence within a paragraph).  I think this is important for programming because they should be able to quickly rearrange the steps within a sequence of instructions.  If they can do it quickly and instinctively, they'll be able to manipulate the logic, without getting distracted or frustrated by the keyboard mechanics.

1. Practice transcribing a paragraph from a book they like.  Include it in the *body* of an example email.

    ```
    Hi Grammy, I just read this in a funny book:
     
    > When her fever finally subsided weeks later, the paralytic polio had...
    ```

1. Transcribe a paragraph, but this time write it in a simple text editor (eg, Notepad, TextEditor, gedit).  Save the file, and attach it in an email.  They should get a concept for a stand-alone file.  And saving.  
    
    One of the times they're transcribing, close the file without saving, and demonstrate the concept of losing work.  Ideally they lose a sentence or two --long enough for them to remember, but not long enough to be cruel.


After a few months of this, much of these mechanics can be performed more naturally, so they have more attention to devote to programming concepts.
