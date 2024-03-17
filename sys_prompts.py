Grammar_tutorial = "Dafny Grammar tutorial: Map Comprehension Expression (grammar)\
Examples:\
map x : int | 0 <= x <= 10 :: x * x;\
map x : int | 0 <= x <= 10 :: -x := x * x;\
function square(x : int) : int { x * x }\
method test()\
{\
  var m := map x : int | 0 <= x <= 10 :: x * x;\
  ghost var im := imap x : int :: x * x;]\
  ghost var im2 := imap x : int :: square(x);}\
    Iterating over the contents of a map uses the component sets: Keys, Values, and Items. The iteration loop follows the same patterns as for sets:\
method m<T(==),U(==)> (m: map<T,U>) {\
  var items := m.Items;\
  while items != {}\
    decreases |items|\
  {\
    var item :| item in items;\
    items := items - { item };\
    print item.0, " ", item.1, "";}\
}"

SYS_DAFNY = "You are an expert in Dafny. \
You will be given tasks dealing with Dafny programs including precise docstrings and annotations.\n"

GEN_ANNO_FROM_BODY = Grammar_tutorial + "Given a Dafny program with only the main code body but no annotations or formal specifications.\
You are asked to fill back in the annotations and formal specifications so that the program can be verified by Dafny. \
Please return the whole program with annotations and specifications filled back in.\
Do not use helper functions.\
Do not modify the function signature and main code body. Do not explain.\
Below is the program:\n"


if __name__ == "__main__":
    print(SYS_GEN_BODY)
    print(GEN_ANNO_FROM_BODY)
