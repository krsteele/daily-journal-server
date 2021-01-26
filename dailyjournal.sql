CREATE TABLE `Entries` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `concept` TEXT NOT NULL,
    `date` INTEGER NOT NULL,
    `entry` TEXT NOT NULL,
    `mood_id` INTEGER NOT NULL,
    FOREIGN KEY(`mood_id`) REFERENCES `Moods`(`id`)
);

CREATE TABLE `Moods` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `mood` TEXT NOT NULL
);

INSERT INTO `Moods` VALUES (null, "happy");
INSERT INTO `Moods` VALUES (null, "sad");
INSERT INTO `Moods` VALUES (null, "grumpy");
INSERT INTO `Moods` VALUES (null, "excited");
INSERT INTO `Moods` VALUES (null, "worried");
INSERT INTO `Moods` VALUES (null, "content");
INSERT INTO `Moods` VALUES (null, "amused");
INSERT INTO `Moods` VALUES (null, "confused");
INSERT INTO `Moods` VALUES (null, "deflated");
INSERT INTO `Moods` VALUES (null, "frazzled");


INSERT INTO `Entries` VALUES (null, "following the bouncing ball", 20201007, "Jisie walked us through sorting the fish we created in the Martin's Aquarium excercise using a data provider module and functions to sort and then create html for our fish.", 8);
INSERT INTO `Entries` VALUES (null, "testing our code", 20201008, "Madi did a great walkthrough of how to test our code using bebugger, console.log(), and breakpoint.", 1);
INSERT INTO `Entries` VALUES (null, "git, importing functions in JS, remainder operators", 20201009, "Worked on creating a data provider array module and the functions to sort that array into new arrays and create html representations of the objects in those arrays.", 4);
INSERT INTO `Entries` VALUES (null, "dependency graph, testing, pseudo coding", 20201012, "Madi walked us through making a dependency graph and building single-responsibility modules. It was super helpful. I still feel behind, though.", 2);
INSERT INTO `Entries` VALUES (null, "2nd group project", 20201013, "Worked with Jayna and David B on our second group project. I love working with them. Learned from David to keep a scratch.txt file to throw code and notes that you might want later. Also learned git diff {file name} to see what has changed in a file since the last commit. And saw him comment each file separately on his commits.", 1);
INSERT INTO `Entries` VALUES (null, "Modern Farm and Career Dev", 20201014, "We had a Career Dev talk today and found out all of the things they will be expecting of us and helping us with. So exciting! I finished the main part of Modern Farm today and passed all the tests! Also, I think I finally figured out my ssh key issue.", 4);
INSERT INTO `Entries` VALUES (null, "using related data", 20201105, "Refactoring my daily journal to use a separate mood json resource to populate the dropdown of this form.", 4);
INSERT INTO `Entries` VALUES (null, "Networking talk with Taylor Desseyn", 20201104, "Refactoring my daily journal to use a separate mood json resource to populate the dropdown of this form.Great talk about networking! Mostly spoke about LinkedIn and how to leverage your profile and contacts. A little overwhelming. He says we should be making 25-50 contacts a day with people and asking them for a chat. Plus posting interesting things often. But also exciting. He was full of positive energy and encouragement. I was worried all day about the election, though, so had a hard time concentrating on anything else.", 5);
INSERT INTO `Entries` VALUES (null, "filter journal entries mood filter and display", 20201112, "Wow! Today I refactored my journal so that I can filter my entries by mood using radio buttons. At first, I broke all my code and Bryan had to come help. But I eventually got it and feel really good about it. I even learned how to toggle the display so that nothing shows in the entry container when there aren't any entries with the chosen mood. Feel very pleased with myself.", 4);


SELECT * FROM Moods;
SELECT * FROM Entries;
