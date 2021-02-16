% arg1 Customer name
% arg2 City
% arg3 Credit rating (aaa, bbb, etc.)
customer(huey, houston, aaa).
customer(dewey, denver, bbb).
customer(louie, lexington, bbb).
customer(curly, cirencester, aaa).
customer(larry, london, ccc).
customer(moe, melton_mowbray, aaa).

% arg1 Item identification number
% arg2 Item name
% arg3 The reorder point for inventory (when at or below this level, reorder)
item(1, mosfet, 10).
item(2, zener_diode, 10).
item(3, led, 1000).

% arg1 Item identification number (same as in the item record)
% arg2 Amount in stock
inventory_item(1, 200).
%inventory_item(1, 9).
inventory_item(2, 11).
inventory_item(3, 1500).

% arg1 Item name
% arg2 Amount in stock
item_quantity(Item, Amount) :-
  item(Item_id, Item, _),
  inventory_item(Item_id, Amount).

inventory_report(Item) :-
  item_quantity(Item, Amount),
  write(Item),
  write(' = '),
  write(Amount),
  nl,
  fail.
inventory_report(_).

good_customer(Customer_name) :-
  customer(Customer_name, _, aaa).
good_customer(Customer_name) :-
  customer(Customer_name, _, bbb).

valid_order(Customer_name, Item, Quantity) :-
  good_customer(Customer_name),
  item_quantity(Item, Amount),
  Amount > 0,
  Quantity < Amount.

reorder(Item) :-
  item_quantity(Item, Amount),
  item(_, Item, Reorder),
  Amount < Reorder,
  write('It is time to reorder'), nl,
  fail.
reorder(Item) :-
  item_quantity(Item, Amount),
  item(_, Item, Reorder),
  Amount >= Reorder,
  write('It is *not* time to reorder'), nl,
  fail.
