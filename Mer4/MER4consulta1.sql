use MER4;
SELECT Polissa.Num_polissa as "Numero de polissa", Tipus_polissa.Nom as "Nom Polissa",Client.DNI, as "Nom Client", Client.Cognom as "Cognom del client"
FROM Client,Polissa, Tipus_polissa
