use MER6;
SELECT Passatger.DNI, Passatger.Nom, Passatger.Cognom, Vol.Num_vol, Vol.Origen, Vol.Desti, Reserves.Import
FROM Passatger, Vol, Reserves
WHERE Passatger.ID=Reserves.Passatger_ID AND
	Vol.ID= Reserves.Vol_ID