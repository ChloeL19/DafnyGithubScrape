/*
  ===============================================
  DCC831 Formal Methods
  2023.2

  Mini Project 2 - Part A

  Your name: Guilherme de Oliveira Silva
  ===============================================
*/


function rem<T(==)>(x: T, s: seq<T>): seq<T>
{
  if |s| == 0 then []
  else if s[0] == x then rem(x, s[1..])
  else [s[0]] + rem(x, s[1..])
}


// The next three classes have a minimal class definition,
// for simplicity
class Address
{
  constructor () {}
}

class Date
{
  constructor () {}
}

class MessageId
{
  constructor () {}
}

//==========================================================
//  Message
//==========================================================
class Message
{
  var id: MessageId
  var content: string
  var date: Date
  var sender: Address
  var recipients: seq<Address>

  constructor (s: Address)
  {
    id := new MessageId();
    date := new Date();
    this.content := "";
    this.sender := s;
    this.recipients := [];
  }

  method setContent(c: string)
  {
    this.content := c;
  }

  method setDate(d: Date)
  {
    this.date := d;
  }

  method addRecipient(p: nat, r: Address)
  {
    this.recipients := this.recipients[..p] + [r] + this.recipients[p..];
  }
}

//==========================================================
//  Mailbox
//==========================================================
// Each Mailbox has a name, which is a string. Its main content is a set of messages.
class Mailbox {
  var messages: set<Message>
  var name: string

  // Creates an empty mailbox with name n
  constructor (n: string)
  {
    name := n;
    messages := {};
  }

  // Adds message m to the mailbox
  method add(m: Message)
  {
    messages := { m } + messages;
  }

  // Removes message m from mailbox. m must not be in the mailbox.
  method remove(m: Message)
  {
    messages := messages - { m };
  }

  // Empties the mailbox messages
  method empty()
  {
    messages := {};
  }
}

//==========================================================
//  MailApp
//==========================================================
class MailApp {
  // abstract field for user defined boxes
  ghost var userboxes: set<Mailbox>

  // the inbox, drafts, trash and sent are both abstract and concrete
  var inbox: Mailbox
  var drafts: Mailbox
  var trash: Mailbox
  var sent: Mailbox

  // userboxList implements userboxes
  var userboxList: seq<Mailbox>

  // Class invariant
  ghost predicate Valid()
  {
    //----------------------------------------------------------
    // Abstract state invariants
    //----------------------------------------------------------
    // all predefined mailboxes (inbox, ..., sent) are distinct
    inbox != drafts &&
    inbox != trash &&
    inbox != sent &&
    drafts != trash &&
    drafts != sent &&

    // none of the predefined mailboxes are in the set of user-defined mailboxes
    inbox !in userboxList &&
    drafts !in userboxList &&
    trash !in userboxList &&
    sent !in userboxList &&

    //----------------------------------------------------------
    // Abstract-to-concrete state invariants
    //----------------------------------------------------------
    // userboxes is the set of mailboxes in userboxList
    forall i :: 0 <= i < |userboxList| ==> userboxList[i] in userboxes
  }

  constructor ()
  {
    inbox := new Mailbox("Inbox");
    drafts := new Mailbox("Drafts");
    trash := new Mailbox("Trash");
    sent := new Mailbox("Sent");
    userboxList := [];
  }

  // Deletes user-defined mailbox mb
  method deleteMailbox(mb: Mailbox)
  {
    // userboxList := rem(mb, userboxList);
  }

  // Adds a new mailbox with name n to set of user-defined mailboxes
  // provided that no user-defined mailbox has name n already
  method newMailbox(n: string)
  {
    var mb := new Mailbox(n);
    userboxList := [mb] + userboxList;
  }

  // Adds a new message with sender s to the drafts mailbox
  method newMessage(s: Address)
  {
    var m := new Message(s);
    drafts.add(m);
  }

  // Moves message m from mailbox mb1 to a different mailbox mb2
  method moveMessage (m: Message, mb1: Mailbox, mb2: Mailbox)
  {
    mb1.remove(m);
    mb2.add(m);
  }

  // Moves message m from mailbox mb to the trash mailbox provided
  // that mb is not the trash mailbox
  method deleteMessage (m: Message, mb: Mailbox)
  {
    moveMessage(m, mb, trash);
  }

  // Moves message m from the drafts mailbox to the sent mailbox
  method sendMessage(m: Message)
  {
    moveMessage(m, drafts, sent);
  }

  // Empties the trash mailbox
  method emptyTrash()
  {
    trash.empty();
  }
}

