use MER7;
select count(*)
FROM Linia_ticket, Ticket, Empleat
WHERE Ticket.Numero = Linia_ticket.Ticket_Num and
Empleat.ID = Ticket.Empleat_ID and
Empleat.ID LIKE '3';