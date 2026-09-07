# Drawing-to-World
## Android MVP Product Specification — Iran

**Version:** 1.0  
**Date:** September 7, 2026  
**Status:** Proposed product baseline for the first release  
**Working title:** Drawing-to-World; the final consumer brand is not selected  
**Product language:** Persian  
**Document language:** English, with selected Persian interface copy

> A child draws a hero, a friend, a playful rival, and a home on paper. With a parent's approval, the app turns those drawings into recognizable characters and objects in one saved, playable adventure world.

This document defines the product, its behavior, scope, business rules, and acceptance criteria. It does not select a software stack, game engine, AI provider, architecture, or implementation method. Numerical limits and targets are proposed product decisions, not measured market facts or demonstrated performance.

---

## 1. Product Summary

### 1.1 The promise

**Draw something. Photograph it. Play with it inside your own world.**

The app is a Persian-first Android creative game for families in Iran. Children create drawings on paper; the app processes an approved photograph and makes the drawing usable inside a simple game. Multiple drawings can coexist in the same adventure, rather than each becoming an isolated animation.

The emotional result should be:

> “That is the character I drew, and this is its world.”

The child's original lines, unusual proportions, colors, and distinctive details are part of the product's value. Replacing the drawing with a polished, generic AI character would undermine the experience.

### 1.2 The first-release experience

The MVP provides one persistent world, four customizable roles, and three short stages of one adventure format. The child can replace the characters and the home over time, replay stages, and maintain a private collection of creations.

AI processes the drawings. It does **not** invent new game rules, generate arbitrary playable levels, or produce a different game engine for each user.

### 1.3 Example

A child draws a blue creature, a cat, a silly three-eyed spider, and a castle. The parent photographs and approves each drawing. In the game, the blue creature becomes the hero, the cat becomes its friend, the spider becomes a gentle obstacle, and the castle becomes their home.

The adventure asks the child to find the cat and reach the castle. The next day, the child draws a robot and swaps it into the hero role without losing the rest of the world.

The child can start playing after creating just one drawing. Built-in artwork fills the other roles until the family replaces it.

### 1.4 Value to each user

For the child, the app connects making something on paper with playing with that creation. For the parent, it provides an understandable creative activity, a controllable purchase, and an optional keepsake to share with family.

These are product hypotheses. The specification does not claim proven educational benefits, clinical benefits, market exclusivity, or validated willingness to pay.

---

## 2. Fixed MVP Scope

| Area | First-release decision |
|---|---|
| Platform | Android phones only. |
| Initial market | Families using the app inside Iran. |
| Intended child audience | Ages 6–12, with a parent managing setup, uploads, purchases, and sharing. |
| Account owner | The parent or guardian, not the child. |
| Profiles | One shared play profile per parent account; no separate sibling profiles. |
| World count | One persistent world per account. |
| Game format | One two-dimensional, side-scrolling adventure format. |
| Playable content | Three authored stages using the same mechanics. |
| Customizable roles | Hero, friend, playful rival, and home. |
| Drawing input | One photographed or selected drawing per transformation. |
| Free allowance | Four successful drawing transformations per verified parent account. |
| Paid product | One repeat-purchase pack containing 20 additional transformations. |
| Recurring billing | None in the MVP. |
| Creation library | Up to 100 saved custom creations. Built-in artwork does not count. |
| Concurrent transformations | One active transformation per account. |
| Offline use | Play downloaded content and use already-saved creations. |
| Sharing | Parent-approved export of a still image; no public gallery. |
| Advertising | None. |
| Planned distribution | One Iranian Android store at launch; Cafe Bazaar is the proposed first channel, subject to publisher and product approval. Myket is a follow-on channel, not a requirement to launch both simultaneously. |

“Persistent world” means the app remembers the family's chosen creations and completed-stage progress. It does not mean a multiplayer world, a continuously running simulation, or an unlimited map.

These decisions define the first release. Deferred features in Section 21 must not be treated as hidden MVP requirements.

---

## 3. Users and Access Boundaries

### 3.1 Child play area

The child can play, browse approved creations, preview their movement, choose which creation occupies each role, and prepare a new drawing capture after the parent has enabled capture access. These activities must not expose account details or purchase controls.

The child can begin a drawing activity, but sending the image for processing and spending a transformation credit requires an adult handoff.

### 3.2 Parent area

The parent controls account ownership, image-processing consent, transformation approval, purchases, credit history, sharing, support, deletion, and recovery.

Use a parent-created six-digit PIN to separate the parent area from ordinary play. The PIN must not appear in the child's interface. Incorrect attempts trigger a temporary cooldown. PIN recovery requires online verification of the parent's account phone number; there is no child-answerable recovery question.

The parent area locks when the adult leaves it or the app moves to the background. A completed upload approval must not leave purchase or privacy settings unlocked.

The PIN is an access control, not proof of legally sufficient parental consent or verified adulthood. Required consent and age-assurance procedures must be confirmed before launch.

### 3.3 Product operator

An operator may investigate failed transformations, incorrect credit balances, payment problems, safety reports, and deletion requests. Routine creation and gameplay must be automated; the product must not depend on an artist or moderator manually preparing every drawing.

Operator access to family information must be limited to the specific support or operational purpose. Private drawings must not become a general browsing gallery for staff.

---

## 4. Primary User Journeys

### 4.1 Try before registration

The first screen offers a short demonstration using built-in artwork. It must work without account registration, camera permission, image upload, payment, or optional analytics consent.

After the demonstration, the app offers to create a character from a drawing and asks the child to involve a parent. Declining setup leaves the demonstration available.

### 4.2 Create the first custom hero

1. The parent creates or signs into an account using their Iranian mobile number and a one-time verification code.
2. The parent reviews the image-processing disclosure, completes the required consent process, and creates the parent PIN.
3. The child selects the hero role and photographs a drawing, or the parent selects an existing drawing image.
4. The family crops and rotates the image so that only the intended drawing remains.
5. The parent reviews the exact image that will be submitted, sees the credit rule, and approves this transformation.
6. The app shows a truthful processing state. Existing play remains available while the result is prepared.
7. A successful creation appears in the library and in a movement preview. One credit is consumed when the usable result is saved and retrievable.
8. The child selects “Use in my world” and immediately plays with it. Default artwork fills the other roles.

No parent should have to buy a pack before seeing a successful custom creation and playing with it.

### 4.3 Expand the world

The child selects the friend, rival, or home slot and adds another drawing through the same approval flow. Previously created drawings remain available. New artwork changes the existing world rather than forcing the child to start a separate game.

### 4.4 Return and play

On later launches, the child sees the same world, its selected characters, and the next available stage. Playing again does not require another transformation, another payment, or a network connection when the needed content is already on the phone.

### 4.5 Purchase more creations

When no credits remain, existing play stays available. A new transformation leads to an adult handoff, not a child-facing payment screen. The parent can purchase the single creation pack or leave without buying.

### 4.6 Share a result

After a completed stage, a parent can approve a still image showing a creation alongside its in-game appearance. The parent previews the image and explicitly chooses whether to save or share it. Nothing is posted automatically.

---

## 5. Drawing Capture and Preparation

### 5.1 Supported drawings

Support an individual, reasonably clear drawing of a person, creature, animal, imagined object, or building on a mostly plain background. Both monochrome and colored drawings are in scope.

A drawing does not need anatomically correct arms, legs, facial features, or proportions. A walking castle or a round creature without legs is acceptable. The selected game role supplies the behavior; the app must not insist on classifying the drawing as a real-world object.

A photograph containing several drawings is acceptable only when the user can crop to one intended subject. Extracting an entire illustrated scene into multiple separate creations is not part of the MVP.

### 5.2 Capture guidance

Provide simple illustrated guidance: put the paper somewhere well lit, keep fingers and faces outside the frame, include the whole drawing, and avoid strong shadows or glare.

Show specific, actionable messages for a blank page, severe blur, poor contrast, a partly cut-off subject, or several competing subjects. Do not describe a child's drawing as ugly, incorrect, or insufficiently talented.

### 5.3 Available preparation controls

The family can take or retake a photograph, select one existing image, crop, rotate, and inspect the selected area. A full drawing editor, paint tools, manual animation tools, and multi-object selection are excluded.

The final approval screen shows the **exact crop** that will be uploaded. It asks the parent to remove real faces, names, school details, addresses, and unrelated background content.

Preparation before submission does not consume credits. The app must never upload the entire camera roll or silently substitute the uncropped image for the approved crop.

### 5.4 Permission behavior

Request camera access only when capture is first used. A denied permission must not prevent sample play or use of existing creations. Image selection must be limited to the image the parent chooses, not broad background access to the photo library.

The MVP does not request microphone, location, contacts, call-log, or SMS-reading permissions. Verification codes can be entered without reading the parent's messages.

### 5.5 Unfinished captures

Allow one unfinished local capture draft. It is not uploaded automatically when the connection returns. The parent must still approve submission.

Temporary app-owned capture material expires after 24 hours unless it has already been discarded sooner. Clearly warn before replacing an unfinished draft. Images originally chosen from the parent's own gallery remain untouched.

---

## 6. AI Transformation Requirements

### 6.1 Required result

A successful transformation delivers one saved creation with a cleanly isolated subject, recognizable colors and shape, a useful library thumbnail, and an in-game movement preview.

The drawing should remain recognizable as the child's work. Preserve distinctive features such as an unusual number of eyes, asymmetric limbs, a crooked roof, and hand-drawn linework. Minor cleanup is acceptable; inventing missing major parts or replacing the style is not.

Movement can be simple: moving across the scene, tilting, bouncing, or celebrating. The MVP does not promise realistic walking, individually articulated limbs, speech, or cinematic animation.

### 6.2 Role behavior

Before creation, the family chooses where the drawing will initially be used. That choice determines the preview and suggested placement, not an immutable restriction on the saved artwork.

A saved creation can later be assigned to any supported role without another AI transformation or credit charge. Reusing an asset in several roles is permitted, provided the game still clearly distinguishes the hero, friend, rival, and home through placement and visual cues.

### 6.3 Unsupported or unsafe input

Reject or request a retake for photographs of real people, unrelated real-world photographs, clearly unsafe material, or images from which a usable subject cannot be obtained. Stylized drawings of human faces are allowed; they must not be confused with a request to create an avatar from a child's real face.

Check the produced result before making it available. An inappropriate or technically unusable result is not a successful delivery and must not consume a credit.

The app must not diagnose personality, intelligence, emotions, health, or family circumstances from a drawing. It must not identify real people or generate harmful interactions involving the child.

### 6.4 Transformation states

| State | User-visible behavior | Credit treatment |
|---|---|---|
| Draft | Crop or retake locally; nothing submitted. | No reservation or charge. |
| Awaiting approval | Parent reviews the image and cost. | No charge. |
| Accepted / queued | Submission has been accepted for this account. | Reserve one available credit. |
| Processing | Show that the drawing is being prepared. | Keep the same reservation. |
| Ready | Safe, usable creation is saved and retrievable from the library. | Convert the reservation into one spent credit. |
| Needs retake / rejected | Explain the appropriate next action without showing unsafe content. | Release the reservation. |
| Failed | Offer a fresh attempt or return to play. | Release the reservation. |
| Cancelled before processing | Confirm cancellation before promising it. | Release the reservation. |

Leaving the progress screen is not cancellation. Once processing has started, explain that the result may still finish and be saved. Do not advertise cancellation after that point unless it can actually be honored.

### 6.5 Reliability rules

Repeated taps, reconnection, or returning to the screen must not submit duplicate paid work. One approved submission can produce at most one creation and one credit deduction.

A phone losing its connection is not, by itself, proof of failure. The app must recover the accepted request's final status instead of starting over or guessing the balance.

An accepted request must reach a final state within ten minutes. A request finalized as failed releases its credit and must not later revive, charge again, or unexpectedly add an asset. This is a product failure boundary, not a promised normal processing time.

If an apparently successful output has an objective defect discovered later, the parent can report it. A confirmed unusable output receives a replacement credit or correction without a second charge. Repeated reports about the same result cannot create repeated credits. An ordinary preference change or voluntary deletion is not an automatic refund.

---

## 7. The Playable World

### 7.1 World contents

The world contains an optional name, four artwork assignments, and progress across three stages. It opens with complete built-in artwork, so an empty slot never blocks play.

| Role | Behavior in the adventure | Examples of user drawings |
|---|---|---|
| Hero | The character directly controlled by the player. | A monster, person, robot, cat, or moving object. |
| Friend | A character found during the stage that then accompanies the hero. | A pet, sibling-inspired fictional character, or imaginary creature. |
| Playful rival | A gentle obstacle following a predictable movement pattern. | A silly spider, cloud, or mischievous creature. |
| Home | The destination that completes the adventure after the friend is found. | A castle, treehouse, cave, tent, or spaceship-shaped home. |

The home is a destination, not an explorable interior. The friend accompanies the hero visually without introducing a separate navigation or escort-failure challenge. Vehicles do not gain driving or flying controls in this release.

### 7.2 Core objective

Every stage uses the same objective:

> Find your friend, then reach home together.

Ten optional stars can be collected along the route. Stars are only a stage score. They are not paid currency, cannot buy transformations, and cannot be exchanged for money.

Finding the friend is required for completion. Collecting all stars is not. Reaching home too early gives a gentle reminder and allows the player to continue looking for the friend.

### 7.3 Controls and difficulty

Provide large left, right, and jump controls, plus pause. The first stage introduces movement and jumping through an illustrated tutorial. Core play must not depend on reading long Persian instructions.

There are no weapons, attacks, health purchases, limited lives, countdown failure timers, or paid retries. Contact with a rival or falling off a platform returns the hero to a nearby safe checkpoint with reassuring feedback.

Stars already collected and the found-friend state survive a checkpoint retry within the same stage attempt. There is no loss of creations or completed-stage progress.

Difficulty comes from simple traversal and predictable obstacles, not frightening content or demanding reflexes. Existing controls and collision fairness must remain consistent regardless of the drawing's silhouette. A larger-looking drawing must not unexpectedly make the game harder.

### 7.4 Included stages

| Stage | Working Persian title | Purpose |
|---|---|---|
| 1 | راه باغ | Introduce movement, finding the friend, and reaching home. |
| 2 | تپه‌های رنگی | Add gentle jumps and predictable rival encounters. |
| 3 | جنگل کاغذی | Combine the same mechanics in a slightly longer route. |

Target a comfortable two-to-four-minute successful run per stage during usability testing. These are authored stages with fixed, tested paths. Changing a drawing must not change whether a route is solvable.

Stage 1 is initially available. Completing it opens Stage 2, and completing Stage 2 opens Stage 3. Previously completed stages remain replayable. All three stages are included in the free product; purchases fund additional creations, not access to the existing game.

### 7.5 Completion and replay

On completion, show the hero and friend celebrating at home, the stars collected, and the next-stage or replay action. Remember completion and the best star count for each stage.

Changes to artwork never reset stage progress. All selected custom roles must appear meaningfully in the playable stage, not only as thumbnails on a menu.

Pause when the app loses focus. Resume the current attempt when its session remains available. After the app is terminated, restarting the unfinished stage is acceptable; losing an already-recorded completion is not.

### 7.6 No open-ended game creation

Children choose roles, drawings, and names; they do not write instructions that change the rules. Requests such as “make the castle fly and add a racing game” are outside the MVP.

The product must not market these three stages as infinitely generated adventures.

---

## 8. Creation Library and World Editing

The library displays custom creations and built-in alternatives with large previews. Children can view a creation, preview its motion, and assign it to a world role. An optional name of up to 24 characters is allowed; role-based Persian defaults must work without typing.

Do not ask for a child's real name. Names and world labels stay private and must not appear in optional analytics.

Swapping artwork, renaming a creation, replaying a preview, and returning to an older creation are free. Selecting another asset does not overwrite or delete the previous one.

A newly created asset is saved before the child decides whether to assign it. The completed transformation has already consumed its credit; “Use in my world” is an assignment action, not the billing trigger.

Permanent deletion requires the parent PIN and confirmation. Deleting artwork currently used in a role replaces that assignment with built-in artwork, preserving a playable world and stage progress.

At the 100-creation limit, prevent a new transformation before reserving a credit. Explain that the parent can delete a creation to free a slot. Disclose the library limit in the purchase area. Unused credits remain available after a slot is freed.

---

## 9. Accounts, Saving, and Offline Behavior

### 9.1 Parent account

Use the parent's Iranian mobile number as the account identifier, with one-time-code verification for sign-in and recovery. Accept the standard local and international forms of the same number without creating separate accounts. Support Persian, Arabic, and Latin digits in entry fields.

The parent must not need a foreign phone number, international payment card, Google account, or social-media account to use the core product.

The account remembers consent status, purchased and available credits, creations, the world, completed-stage progress, and recoverable purchase history. Do not require a child email address, date of birth, school, address, or identity document.

### 9.2 Saving and recovery

World changes and completed stages must be saved on the phone promptly. When connected and consent permits, the app backs up the world and saved creations to the parent account and shows whether that backup is current.

A parent signing in on a replacement phone can recover the most recent successfully backed-up state and unspent credits. Clearly disclose that unsynchronized changes from a lost or uninstalled phone cannot be recovered.

The MVP supports one primary phone per account, not simultaneous collaborative editing. Moving to another phone is an explicit parent-confirmed transfer. A previous phone may retain an offline playable copy, but after reconnecting it must not spend credits, overwrite the new primary world's state, or continue backing up as the primary device. Do not promise immediate remote erasure of an offline device.

### 9.3 Offline capability

| Action | Offline behavior |
|---|---|
| Play built-in demonstration | Available. |
| Play with creations already downloaded | Available. |
| View and assign downloaded creations | Available; world changes await backup. |
| Prepare a capture draft | Available after capture access has been enabled; no automatic upload. |
| Submit a transformation | Not available; preserve the draft and explain why. |
| Sign in, recover a PIN, or transfer phones | Requires a connection. |
| Buy or verify a creation pack | Requires a connection and an available approved payment channel. |
| Review cached account information | Clearly label balances or statuses that may be out of date. |
| Request remote deletion | Requires confirmed receipt; an offline request must not be shown as completed. |

Running out of credits or temporarily losing access to the processing service must never lock already-downloaded play. Normal replay must not trigger new AI processing.

---

## 10. Required Screens

These are functional surfaces; closely related surfaces may share a screen where that improves usability.

| Screen | Required content and actions |
|---|---|
| Welcome and sample play | Explain the idea visually, start the sample, and offer a parent-assisted first creation. |
| Parent setup and sign-in | Phone verification, clear processing disclosure, required consent, and parent PIN setup. |
| My World | Show the four roles, current artwork, stage progress, Play, and Add a Drawing. |
| Role selection | Explain hero, friend, rival, and home with examples. |
| Capture / image selection | Show drawing guidance, capture controls, selected-image access, and permission alternatives. |
| Crop and review | Crop, rotate, retake, inspect the exact proposed upload, and hand off to the parent. |
| Parent transformation approval | Show upload disclosure, available credits, the one-credit success rule, and explicit approval. |
| Processing | Show real status, leave-to-play action, recovery state, and useful failure messages. |
| Creation preview | Show the completed asset, motion preview, optional name, and assignment action. |
| Creation library | Browse custom and built-in artwork, choose a role, and enter parent-only deletion. |
| Stage selection and gameplay | Show stage availability, objective, movement controls, pause, and checkpoints. |
| Stage result | Show celebration, stars, next stage, replay, and an optional parent sharing handoff. |
| Parent area | Credits, purchase history, privacy controls, backup status, account recovery, support, and deletion. |
| Creation-pack purchase | Show the single pack, exact price and units, what it buys, and recoverable payment states. |
| Share preview | Show the exact outgoing image and require an explicit parent save/share action. |
| Help and error details | Give practical next steps and a support reference without exposing private diagnostics to children. |

Capture, menus, and parent controls use portrait layouts; gameplay uses landscape. Switching between them must not lose a draft, trigger another submission, or erase progress.

---

## 11. Monetization and Credit Rules

### 11.1 The offer

The free product includes sample play, four successful custom creations, all three stages, unlimited replay, world editing, and parent-approved still-image export.

The only paid product is a **20-creation pack**. There is no subscription, automatic renewal, ad viewing requirement, membership tier, or purchase necessary to keep playing existing content.

The pack price in toman is an outstanding commercial decision. It must be set after measuring the actual cost of successful creations, failed attempts, payment costs, and support. No current market price or profitable price is assumed in this document.

Unused credits do not expire while the service remains available. Terms must explain the treatment of unused purchases if the service closes; do not promise permanent online availability.

### 11.2 What one credit buys

One credit buys one safe, usable creation that is saved and retrievable. It includes the processing needed for that result and its standard previews.

No credit is consumed for cropping, validation rejection, processing failure, a cancelled queued request, replay, renaming, role changes, or reusing artwork.

A new successfully processed photograph is a new creation and consumes a credit, even if it resembles an earlier drawing. Do not automatically regenerate an existing creation just because the user opens it again.

### 11.3 Balance behavior

Show available, temporarily reserved, and spent credits distinctly in the parent area. Spend the free allowance before paid credits. A reservation temporarily reduces what can be submitted but is not a completed charge.

Free credits are issued once per verified parent account, not again after reinstalling, transferring phones, or clearing app data. Avoid invasive device fingerprinting as an anti-abuse shortcut.

Duplicate approvals, duplicated payment notifications, and repeated support actions must not duplicate credits or charges. Maintain an understandable parent-visible history of purchases, successful creations, released reservations, and adjustments.

### 11.4 Payments in Iran

Use the launch store's approved purchase route for digital goods. Do not assume one store's rules authorize another store's payment flow or an external checkout. Verification of the actual publisher agreement and payment eligibility is a release gate.

Show the complete payable amount and its unit before purchase. The app's parent-facing prices use **تومان**. Where the payment provider presents **ریال**, the amounts must be reconciled and the difference in units made explicit; a tenfold unit error is a release-blocking defect.

The app must not collect or store bank-card credentials. A successful-looking return from a payment screen is not sufficient on its own to grant credits; the purchase must have a confirmed outcome.

### 11.5 Payment outcomes

| Outcome | Required behavior |
|---|---|
| Cancelled | Return to the app without credits or an error implying the parent owes money. |
| Failed | Explain failure and allow a fresh attempt. |
| Pending or interrupted | Show a recoverable pending purchase. Ask the parent to check status rather than pay again immediately. |
| Verified successful | Add exactly 20 credits once and show a receipt reference. |
| Payment completed but app closed | Recover the purchase on reopening without requiring another payment. |
| Reinstall or phone transfer | Recover the account's remaining balance; do not recreate credits already spent. |
| Confirmed refund | Reconcile the affected purchase once and remove its remaining unspent credits. Do not create a negative balance or silently charge the parent again. |

Refund handling must follow the applicable store and consumer requirements. A refund does not automatically delete the child's existing artwork or block offline play. Suspected repeated abuse is an adult support matter, not an accusatory child-facing screen.

### 11.6 No pressure on children

The child must not see limited-time purchase countdowns, guilt messages, paid rescue prompts, randomized paid rewards, or characters expressing distress because no purchase was made.

An exhausted allowance should lead to a neutral parent handoff while keeping existing play available. Do not place a purchase prompt over an active game.

---

## 12. Child Safety and Parent Control

Treat the product as child-directed throughout the experience. Do not route around child protections by describing the account owner as an adult.

The parent must approve each new image submission, including transformations using free credits. The approval must explain that the selected drawing is sent for automated processing and that a usable result consumes one credit.

The first-release safety boundary excludes public profiles, chat, strangers, multiplayer, public comments, follower counts, location features, personalized advertising, and an open-ended AI companion. There is no conversational character that encourages a child to disclose personal information.

Default art, sound, game behavior, and transformation output must remain appropriate for the target audience. Playful monsters are acceptable; graphic injury, sexual content, hateful imagery, realistic threats, and frightening transformations are not.

The app must never claim safety checks are infallible. Parents can report a concerning result from the parent area. A reported creation can be hidden immediately and replaced with a built-in asset while the issue is handled. Unsafe output must not be reproduced in a public report or exposed in the child interface.

Do not include streak penalties, energy systems, hunger mechanics that punish absence, or re-engagement messages directed at children. The MVP does not need push notifications.

Camera guidance must never ask the child to photograph themselves, their bedroom, another person, an identity document, or a dangerous location. The task is to photograph the drawing.

---

## 13. Privacy, Retention, and Deletion

### 13.1 Data minimization

Transmit only the approved crop, not the surrounding original photograph. Remove photo metadata that is unnecessary for the transformation before transmission. A parent must be able to inspect the actual submitted pixels; metadata removal alone is not sufficient when personal details are visible inside the image.

Do not sell drawings or use them for advertising, face recognition, or training AI models. Do not allow a processing supplier to use them for its own model training. Supplier eligibility for child-directed use, service in Iran, retention, and deletion must be verified before use.

Account and purchase data must not be sent to an image-processing provider unless strictly required for the disclosed function. Account ownership must not expose one family's creations to another family.

### 13.2 Retention commitments

The following are proposed maximum retention requirements. They must be achievable by the product and all relevant processing suppliers before they are promised to users.

| Data | Required treatment |
|---|---|
| App-created full capture photo | Keep only for local preparation; discard after crop confirmation or abandonment, with a 24-hour maximum. |
| Unsubmitted cropped draft | Keep locally for up to 24 hours or until discarded. Do not automatically upload it. |
| Submitted crop and rejected/failed output | Delete from processing systems within 24 hours of submission; do not retain as a permanent support archive. |
| Successful cutout and playable creation | Retain while part of the parent's account so it can be replayed and recovered. |
| World assignments and completed-stage progress | Retain for the active account, subject to parent deletion. |
| Optional identifiable/pseudonymous usage events | Retain for at most 30 days; aggregate reporting must not retain drawing content or private labels. |
| Support image attachment | Collect only by explicit parent choice and delete within 30 days of case closure. |
| Financial records | Retain only the records and duration required by the applicable rules and disclosed launch policy; determine the exact schedule before paid release. This exception does not justify keeping drawings. |

### 13.3 Deletion

The parent can permanently delete a creation or the account. Explain the consequences and offer to review unused purchases and save an approved keepsake before account deletion. Do not block a valid deletion request merely to preserve engagement or spending.

After a confirmed deletion request, remove the content from normal account access immediately, erase it from active systems within seven days, and expire backup copies within 30 days. Restoration from a backup must not make deleted content accessible again.

Cancel or suppress in-progress output for a deleted account so it cannot recreate content after deletion. Parent-account deletion also stops optional analytics collection and removes associated event-level records within the deletion window, except narrowly justified records disclosed in the actual policy.

Deletion cannot recall images the parent has already shared outside the app, remove files the parent independently saved, or instantly erase a phone that remains offline. Explain these limits without implying public sharing is part of the default product.

### 13.4 Consent controls

Parents can withdraw permission for new image processing without losing the ability to play downloaded creations. Explain separately how to delete saved content.

Optional product analytics is off by default and separate from essential service and payment records. Declining it must not change the free allowance, game access, pricing, or drawing quality. Do not describe pseudonymous account-linked events as anonymous.

A written privacy notice, the actual supplier arrangements, the interface disclosures, and the running product must describe the same behavior. Applicable legal requirements and store rules require a qualified release review; this specification is not that legal review.

---

## 14. Persian Localization and Accessibility

The child experience and parent area must be fully usable in Persian. Navigation, menus, dialogs, receipts, and errors use proper right-to-left layout and correct Persian text shaping. Phone numbers and transaction references remain readable in their appropriate direction.

Use Persian numerals for ordinary counts and toman prices; accept Persian, Arabic, and Latin digits where numbers are entered. Parent-facing calendar dates use the Jalali calendar. Do not translate a physical left/right movement control into a mirrored action simply because the interface is right-to-left.

Use large touch targets, icon-plus-text explanations, visible feedback, and adequate contrast. Do not rely only on color to identify an action or role. Music and sound effects can be muted, and every critical instruction must remain understandable without sound.

Optional short, prerecorded Persian prompts may reinforce the illustrated tutorial. Generated speech, voice cloning, speech recognition, and voice storytelling are not required.

### Suggested interface copy

| Purpose | Persian copy |
|---|---|
| Main promise | نقاشی‌ات را بکش؛ با آن بازی کن. |
| World screen | دنیای من |
| Add a drawing | یک نقاشی اضافه کن |
| Hero role | قهرمان من |
| Friend role | دوست من |
| Rival role | موجود بازیگوش |
| Home role | خانهٔ من |
| Parent handoff | برای ادامه، از یکی از والدین کمک بگیر. |
| Capture guidance | نقاشی را کامل داخل کادر بگذار. |
| Processing | داریم نقاشی‌ات را برای بازی آماده می‌کنیم. |
| Ready | نقاشی‌ات آمادهٔ بازی است! |
| Assignment | در دنیای من استفاده کن |
| Objective | دوستت را پیدا کن و با هم به خانه برگردید. |
| Retake | عکس واضح نیست. یک بار دیگر عکس بگیر. |
| Offline creation | برای آماده‌کردن نقاشی جدید، به اینترنت نیاز داریم. |
| Parent credit explanation | هر نقاشی که با موفقیت آماده شود، یک اعتبار مصرف می‌کند. |
| Failed transformation | نقاشی آماده نشد؛ اعتباری از شما کم نشد. |

Copy describing a failed request must be used only after failure and credit release are confirmed. A temporary connectivity problem needs a different message.

---

## 15. Parent-Approved Sharing

Provide one still-image format: a clean card featuring the extracted drawing and a scene from its playable world. Do not use the original uncropped photograph or upload the result to a public page.

The outgoing image must omit the parent's phone number, transaction details, account identifiers, and technical metadata. Private world and creation names are excluded by default. A small product mark is acceptable, but the final brand must be approved before release.

Require the parent PIN, show the exact image, and let the parent decide whether to save it or choose an external destination. Do not preselect a social network, require a post to unlock credits, or send invitations to contacts.

The app does not provide public share links, a hosted family gallery, video export, or direct social-media publishing in the MVP.

---

## 16. Information the Product Must Remember

This is a business-information inventory, not a database or API design.

| Information | Why the product needs it |
|---|---|
| Parent account and verified contact | Sign-in, recovery, consent ownership, and purchase support. |
| Consent choices and their version/date | Respect the parent's current permissions and explain what was agreed. |
| Creation record | Ownership, name, approved playable artwork, creation date, and availability. |
| Transformation outcome | Distinguish pending, completed, rejected, and failed requests without duplicating charges. |
| World record | Name, four selected assets, completed stages, best star counts, and backup state. |
| Credit history | Explain grants, reservations, spending, releases, purchases, and adjustments. |
| Purchase record | Recover and reconcile a verified purchase, including a receipt reference and final status. |
| Support reference | Investigate a specific issue without requiring unnecessary private images. |
| Deletion status | Complete erasure and prevent deleted material from reappearing during recovery. |

A creation belongs to exactly one parent account. Another account cannot retrieve it by guessing a reference. Deleted or rejected creations cannot remain selectable through old previews or cached lists after the app has received their updated status.

---

## 17. Essential Error and Recovery Cases

| Situation | Required outcome |
|---|---|
| Camera access denied | Explain how to enable it and keep sample play and selected-image input available where permitted. |
| No clear drawing detected | Request a better crop or photo without charging. |
| Multiple subjects | Ask the family to crop to one subject. |
| Private information visible | Ask the parent to remove it before submission; do not promise perfect automatic detection. |
| Inappropriate input or output | Do not deliver it to the child. Give a neutral explanation and release the credit. |
| No network before submission | Keep the local draft; do not reserve a credit or silently submit later. |
| Network lost after acceptance | Recover the same request rather than submitting and charging again. |
| App closes during processing | Recover the creation or final failure when reopened. |
| Device cannot download a ready asset | Keep the saved result available for download; do not charge a second time. |
| Insufficient local storage | Explain how to make space before deleting any artwork; keep the recoverable account copy. |
| Processing unavailable | Preserve existing play and disable new paid processing submissions gracefully. |
| Credits exhausted | Preserve existing play and offer a parent handoff. |
| Library full | Stop before credit reservation and offer parent-managed deletion. |
| Parent deletes an assigned creation | Replace its role with built-in artwork and preserve progress. |
| Payment result unknown | Show pending verification and a status-recovery action, not an immediate pay-again demand. |
| Offline account-deletion attempt | Show that remote deletion is not yet confirmed. |
| Old phone reconnects after transfer | Do not allow its older world to overwrite the new primary phone's saved state. |

All errors must be understandable in Persian. Raw technical messages, provider names, and internal diagnostics belong in parent support details only where useful, not in the child's play area.

---

## 18. Minimum Operational Capabilities

The product needs a limited internal support capability, not a comprehensive administration platform.

An authorized operator must be able to locate an account or purchase from a parent-provided reference; see transformation status and non-image failure information; inspect the relevant credit history; issue a justified correction once; handle safety and deletion reports; and pause new transformations or sales during a serious service problem.

Record sensitive operator actions, including credit changes and exceptional access to an explicitly attached support image. Ordinary analytics and support lists must not display source photographs.

The parent area must provide a Persian help contact and a way to submit a problem with its reference. Uploading a diagnostic screenshot or drawing is optional and separately approved. Routine payment reconciliation and processing recovery must not depend on a manual support message.

---

## 19. Quality Targets and Product Validation

### 19.1 Provisional device and performance targets

The initial compatibility target is Android 10 or newer, 3 GB of memory, and a 720p-class phone display. This is a proposed support floor, not a claim about the Iranian installed device base. Confirm and publish a tested device range before release.

Target smooth 30-frame-per-second gameplay on the agreed minimum test phone. Once content is present locally, starting a stage should take no more than five seconds under the agreed test conditions.

For a supported drawing, target a median transformation time below 30 seconds and a 90th-percentile time below 90 seconds under a documented healthy connection. Measure upload, processing, saving, and result availability together. These are validation targets, not claims that the product already meets them.

Also test slow uploads, temporary disconnection, service interruption, app termination, payment interruption, and recovery on representative networks inside Iran. Core operation should not require the end user to arrange a VPN or an international account.

### 19.2 Drawing-quality validation

Use at least 100 permitted test drawings covering monochrome and colored work, simple and unusual shapes, hand-drawn human faces, nonhuman characters, thin lines, irregular proportions, and buildings. Include separate invalid-input tests for blur, blank pages, real-person photographs, and unsafe material.

Target at least 90% usable first-pass results for inputs that meet the supported capture guidance. Independently review whether major features and colors remain recognizable; a technically completed response is not automatically a usable result.

Test with parent-child pairs to establish whether children recognize their own artwork, understand the controls, and can put at least two drawings into the same playable world. Obtain appropriate permissions for any testing material; test drawings must not silently become training data.

### 19.3 Product questions to validate

The main questions are whether families complete the first drawing-to-play flow, create a second asset, return to the same world, and consider purchasing another creation pack after seeing the free experience.

For parents who opt into usage measurement, track the funnel from setup to approved submission, ready creation, first custom stage, second custom creation, and return play. Define an activated family as one that creates a custom asset and completes a stage using it. Measure seven-day return among activated families eligible for that measurement.

Use essential operational records to measure usable-delivery rate, failures, turnaround, credit corrections, payment recovery, and support volume. Do not send images, private names, or phone numbers into optional behavioral reporting.

Price testing must include the cost of failed attempts and retries, not just successful processing calls. Do not scale paid acquisition until actual purchases have positive contribution after attributable processing, payment, refund, and support costs. Retention and sales targets should be set from the pilot rather than presented as invented market benchmarks.

---

## 20. Release Acceptance Criteria

All of the following are required for the MVP release. “Ready” means demonstrated behavior, not a screen mockup.

- [ ] **AC-01 — Honest demonstration:** A new user can play the sample without registration, camera access, uploads, or payment.
- [ ] **AC-02 — Parent ownership:** Custom processing requires the parent account, required consent, and an explicit adult approval.
- [ ] **AC-03 — Approved pixels only:** The uploaded image matches the final crop preview, without the discarded surrounding photo or unnecessary metadata.
- [ ] **AC-04 — Recognizable result:** Supported test drawings meet the agreed usable-output and fidelity thresholds.
- [ ] **AC-05 — Actual play:** A successful custom hero can move, jump, and complete a stage; it is not merely an animated preview.
- [ ] **AC-06 — Multi-drawing world:** Four different creations can occupy the four roles and appear together in the same playable adventure.
- [ ] **AC-07 — One-drawing start:** One custom hero plus built-in alternatives is sufficient to play.
- [ ] **AC-08 — Creative shapes:** A non-humanoid or unusually proportioned drawing does not require fabricated limbs or make the stage unfair.
- [ ] **AC-09 — Tested game content:** Each of the three stages is completable, with the correct friend-before-home rule and optional stars.
- [ ] **AC-10 — Gentle retries:** Checkpoint retries are free and preserve the current attempt's collected stars and friend state.
- [ ] **AC-11 — Persistent world:** Restarting the app preserves artwork assignments and completed-stage progress.
- [ ] **AC-12 — Free reuse:** Replaying, renaming, reassignment, and previews consume no transformation credits.
- [ ] **AC-13 — Exactly-once spending:** Double taps, reconnects, and reopened screens do not duplicate creations or credit deductions.
- [ ] **AC-14 — Fair failure:** Rejected, failed, and confirmed-cancelled requests release their reserved credit; finalized failures cannot later charge.
- [ ] **AC-15 — Usable completion:** A charged successful result is saved and recoverable, even when the original phone disconnects before viewing it.
- [ ] **AC-16 — Free allowance:** One verified parent account receives four free successful creations, without reissuing them on reinstall.
- [ ] **AC-17 — Purchase recovery:** A verified purchase grants exactly 20 credits once, including when the app closes during payment.
- [ ] **AC-18 — Currency clarity:** Toman and rial displays reconcile correctly and show an unambiguous total before payment.
- [ ] **AC-19 — No child checkout:** A child cannot open payment, external sharing, privacy changes, or deletion without the parent handoff.
- [ ] **AC-20 — Offline play:** Downloaded custom content remains playable without credits, network access, or repeated processing.
- [ ] **AC-21 — Safe fallback:** Deleting an active creation leaves the world playable using built-in artwork.
- [ ] **AC-22 — Recovery:** A parent can restore the latest confirmed backup and remaining balance on a replacement phone.
- [ ] **AC-23 — Transfer protection:** The old phone cannot overwrite the new primary world's state after reconnecting.
- [ ] **AC-24 — Private ownership:** One family cannot access another family's assets or purchase records.
- [ ] **AC-25 — Safety controls:** Known unsafe test inputs and outputs are blocked before child display, with a working parent report path.
- [ ] **AC-26 — Verified deletion:** Retention limits and deletion behavior are demonstrated, including processing suppliers and backup restoration.
- [ ] **AC-27 — Consent withdrawal:** Disabling future image processing stops new uploads without locking existing downloaded play.
- [ ] **AC-28 — Persian usability:** All critical flows, errors, numeric inputs, and payment labels work correctly in Persian and right-to-left layouts.
- [ ] **AC-29 — Parent-approved export:** Sharing uses the exact approved still image, excludes account identifiers, and never posts automatically.
- [ ] **AC-30 — Network and device testing:** The published compatibility and availability claims match actual tests, including testing inside Iran.

### Mandatory launch decisions

Before public release, confirm the final brand and rights to bundled artwork/audio; the actual supported device floor; the chosen store's publisher eligibility, age/content classification, and current rules; the processing suppliers' permission and capability to serve this child-directed product in Iran; the required parental-consent process; and the exact privacy, retention, and deletion commitments.

Before accepting payments, also approve the pack price, verified purchase and refund behavior, payment currency presentation, financial-record retention schedule, support contact, and treatment of unused purchases on shutdown.

These unresolved commercial and compliance decisions do not authorize changing the core scope. A supplier that cannot meet the child-data requirements is a launch blocker, not a reason to quietly weaken the published privacy promise.

---

## 21. Explicitly Outside the MVP

Do not include iOS or a browser game; multiple child profiles or worlds; multiplayer; public galleries; messaging; followers; leaderboards; referrals; schools or classroom management; subscriptions; advertisements; multiple paid tiers; or a collectible virtual economy.

Do not include three-dimensional worlds, augmented reality, realistic anatomical animation, generated game code, freely generated level layouts, unrestricted stories, voice prompts, voice cloning, AI-character chat, vehicle mechanics, explorable buildings, a manual level editor, or an in-app drawing application.

Do not include video export, physical merchandise, printing services, emotional analysis of drawings, or educational/therapeutic assessment claims.

A later release could explore additional authored adventure packs, richer animation, more world objects, and bounded story choices. Those possibilities are not commitments for the first release.

---

## 22. External References and Evidence Boundaries

The product requirements above are proposed design decisions. They are not a claim that the app has already obtained store approval, that an AI supplier is eligible, or that there are no Iranian competitors.

The following official references were checked on September 7, 2026. Recheck applicable policies before publishing; only the chosen distribution channel's actual agreement determines that channel's obligations.

**[S1] Myket — In-app purchase concepts.** Myket documents digital products, consumable versus non-consumable purchases, and the requirement for its client and an internet connection during a Myket purchase. This supports considering a repeat-purchase creation pack for a Myket edition; it does not establish approval for this particular app.  
https://myket.ir/kb/en/pages/understanding-myket-in-app-purchase-concepts/

**[S2] Myket — Privacy, security, and permissions.** Its published guidance addresses meaningful disclosure, consent, necessary permissions, and treatment of personal information. The product's specific retention periods in this document are our proposed commitments, not deadlines asserted by this source.  
https://myket.ir/kb/pages/privacy-security-access-info-fa/

**[S3] Myket — Publishing rules.** The official policy index includes content, privacy, permissions, payments, and misleading-behavior rules. A Myket release needs review against the full applicable policy, not only its payment documentation.  
https://myket.ir/kb/topics/myket-app-publishing-rules-fa/

**[S4] Google Play — Families policies.** Google Play treats camera data as sensitive in its child-data requirements and addresses child-directed content, third-party services, social features, and monetization. These rules are relevant if a Google Play edition is later pursued; they must not be presented as the governing policy of an Iranian store.  
https://support.google.com/googleplay/android-developer/answer/9893335?hl=en

**Cafe Bazaar verification gap:** Its official in-app-billing documentation endpoint returned a loading page in this check, so its detailed current requirements were not verified here. The proposed Cafe Bazaar launch remains conditional on reviewing the actual publisher documentation and agreement. No commission, payment permission, or approval claim is inferred.  
https://developers.cafebazaar.ir/fa/guidelines/in-app-billing

---

## Definition of the Finished MVP

> A parent in Iran can install the Android app, try it without uploading anything, approve four photographed drawings, and let their child use those drawings together in a saved Persian-language adventure. The child can return and replay offline. The parent can buy more creations through the approved local payment route, recover a purchase or account, control sharing, and delete the family's data. Processing failure never silently consumes a credit, and the app never claims to generate arbitrary games or fully understand a child's imagination.
