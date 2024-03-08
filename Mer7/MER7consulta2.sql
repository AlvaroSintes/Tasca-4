use MER7;
select Ticket.Num_factura, Ticket.Data, Empleat.Nom, Empleat.Cognom
FROM Ticket, Empleat, Producte, Linia_ticket
WHERE Producte.ID= Linia_ticket.Producte_ID and
Ticket.Numero = Linia_ticket.Ticket_Num and
Empleat.ID= Ticket.Empleat_ID and
Producte.Nom="Salmon";