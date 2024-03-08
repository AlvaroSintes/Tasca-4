use MER5;
SELECT Client.Nom, Vehicle.marca, Tipus_vehicle.Nom, Cita.Data, Client_vehicle.Data_final
FROM Client, Vehicle, Tipus_vehicle, Cita, Client_vehicle
WHERE Client.DNI=Client_vehicle.Client_DNI AND 
	Vehicle.Num_carroseria = Vehicle.Num_carroseria AND 
	Tipus_vehicle.ID=Vehicle.Tipus_vehicle_ID AND
    Client_vehicle.ID=Cita.Vehicle_ID;