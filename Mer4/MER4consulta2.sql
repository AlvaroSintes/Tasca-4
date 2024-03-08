use MER4;
SELECT Polissa.Num_polissa as "Numero de polissa", Tipus_polissa.Nom as "Nom Polissa", Client.DNI, Client.Nom as "Nom Client", Client.Cognom as "Cognom del client"
FROM Client,Polissa, Tipus_polissa
WHERE Client.DNI = Polissa.Client_DNI and Tipus_polissa.ID = Polissa.Tipus_polissa_ID and Tipus_polissa.Nom = "Viatge";