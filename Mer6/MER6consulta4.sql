use MER6;
SELECT Reserves.Data, Reserves.Import, Vol.Num_vol, Passatger.Nom, Passatger.Cognom
FROM Reserves, Vol, Passatger
WHERE Passatger.ID=Reserves.Passatger_ID and Vol.ID=Reserves.Vol_ID and Vol.Data_sortida="20-7-16"