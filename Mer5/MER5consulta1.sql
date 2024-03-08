use MER5;
SELECT Client.Nom, Vehicle.Marca, Tipus_vehicle.Nom, Cita.Data, Client_vehicle.Data_final
FROM Client, Vehicle, Tipus_vehicle, Cita, Client_vehicle
WHERE Client.DNI=Client_vehicle.Client_DNI and Tipus_vehicle.ID=Vehicle.Tipus_vehicle_ID and 
	Client_vehicle.ID =Cita.Vehicle_ID and Cita.Data>"2006-02-14";