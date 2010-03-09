use Random;
use BlockDist;

config const seed: int = 1;
config const n: int = 8;

{
  var rs = new RandomStream(seed);

  writeln(for i in 1..n do format("#.#####", rs.getNext()));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  writeln(for i in 1..n do format("#.#####", rs.getNth(i)));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [1..n] real;
  rs.fillRandom(A);
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [1..n/2, 1..2] real;
  rs.fillRandom(A);
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [[1..n] distributed Block(rank=1,bbox=[1..n])] real;
  rs.fillRandom(A);
  writeln(for e in A do format("#######", e.locale.id));
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [[1..n] distributed Block(rank=1,bbox=[1..n/2])] real;
  rs.fillRandom(A);
  writeln(for e in A do format("#######", e.locale.id));
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [[1..n] distributed Block(rank=1,bbox=[1..n])] real;
  forall (a,r) in (A,rs.iterate(A.domain)) do
    a = r;
  writeln(for e in A do format("#######", e.locale.id));
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [[1..n] distributed Block(rank=1,bbox=[1..n/2])] real;
  forall (a,r) in (A,rs.iterate(A.domain)) do
    a = r;
  writeln(for e in A do format("#######", e.locale.id));
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [[1..n] distributed Block(rank=1,bbox=[1..n])] real;
  forall (r,a) in (rs.iterate(A.domain), A) do
    a = r;
  writeln(for e in A do format("#######", e.locale.id));
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}

{
  var rs = new RandomStream(seed);

  var A: [[1..n] distributed Block(rank=1,bbox=[1..n/2])] real;
  forall (r,a) in (rs.iterate(A.domain), A) do
    a = r;
  writeln(for e in A do format("#######", e.locale.id));
  writeln(for e in A do format("#.#####", e));
  writeln(rs.getNext());

  delete rs;
}
