
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct __Trip
{
    uint32_t    Start;
    uint32_t    End;
    uint32_t    Distance;
    uint32_t    PackageWeight;
    uint32_t    X;
} Trip_t;

typedef struct __Trips
{
    Trip_t      *Trips;
    uint32_t    TripsCount;
} Trips_t;

typedef struct __Vehicle
{
    uint32_t    MaxDistance;
    uint32_t    MaxCapacity;
    uint32_t    Price;
    Trips_t     Trips;
//    Trip_t      *Trips;
//    uint32_t    TripsCount;
} Vehicle_t;

typedef struct __Customer
{
    uint32_t    *RelativeDistances;
    uint32_t    PackageWeight;
} Customer_t;

#define N   4
#define K   3

uint32_t DISTANCE[N][N] =
{
    { 0,    19, 82, 88 },
    { 91,   0,  60, 73 },
    { 60,   30, 0,  85 },
    { 61,   28, 63, 0 }
};

Vehicle_t VEHICLES[K] =
{
    {
        .MaxDistance = 10,
        .MaxCapacity = 23423,
        .Price = 30,
        .Trips =
        {
         .Trips = NULL,
         .TripsCount = 0
        }
    },
    {
        .MaxDistance = 20,
        .MaxCapacity = 534534,
        .Price = 77,
        .Trips =
        {
         .Trips = NULL,
         .TripsCount = 0
        }
    },
    {
        .MaxDistance = 100,
        .MaxCapacity = 2342,
        .Price = 30,
        .Trips =
        {
         .Trips = NULL,
         .TripsCount = 0
        }
    }
};

Customer_t CUSTOMERS[N] =
{
    {
        .RelativeDistances = DISTANCE[0],
        .PackageWeight = 0
    },
    {
        .RelativeDistances = DISTANCE[1],
        .PackageWeight = 87687
    },
    {
        .RelativeDistances = DISTANCE[2],
        .PackageWeight = 2312
    },
    {
        .RelativeDistances = DISTANCE[3],
        .PackageWeight = 612
    }
};

Trip_t * genTrips(Customer_t *customers, uint32_t customersCount);
Vehicle_t * getVehicles(uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount);
Customer_t * getCustomers(uint32_t customersCount);
Trips_t * vehicle_GetNextTrips(Vehicle_t *vehicle, Trip_t *trip);
bool vehicle_CheckDistanceLimitation(Vehicle_t *vehicle);
bool vehicle_CheckCapacityLimitation(Vehicle_t *vehicle);
void vehicles_CheckCapabilityIndividualTrip(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount);
void vehicles_CheckValidTrips(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount);
void vehicles_CheckUsable(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount);
void vehicle_DisplayTrips(Vehicle_t *vehicle);
void vehicles_DisplayTrips(Vehicle_t *vehicles, uint32_t vehiclesCount);

Vehicle_t *vehicles;
Customer_t *customers;

bool checkGeneral(Vehicle_t *vehicle, Trip_t *trip)
{
    uint32_t t = vehicle->Trips.TripsCount;
    while(t-- > 0)
    {
        if (vehicle->Trips.Trips[t].X == 1)
        {
            if ((trip->Start == 0) &&
                (trip->End == 0))
            { return true; }

            if ((vehicle->Trips.Trips[t].Start == trip->End) &&
                (vehicle->Trips.Trips[t].End == trip->Start))
            {
                printf("Fail general: %d->%d, t = %d\n", trip->Start, trip->End, t);
                return false;
            }
        }
    }

    return true;
}

int main(void)
{
    uint32_t i, j, k, t, c;
    uint32_t customersCount = N;
    uint32_t vehiclesCount = K;

    /* Get vehicles list and customers list */
    customers = getCustomers(customersCount);
    vehicles = getVehicles(vehiclesCount, customers, customersCount);

    Trips_t trips = vehicles[0].Trips;
    c = pow(2, trips.TripsCount);

    while(c-- > 0)
    {
        t = vehicles[0].Trips.TripsCount;
        while(t-- > 0)
        {
            vehicles[0].Trips.Trips[t].X = (c & (1 << t)) >> t;
            if ((vehicles[0].Trips.Trips[t].Start != 0) &&
                (vehicles[0].Trips.Trips[t].Start == vehicles[0].Trips.Trips[t].End))
            { vehicles[0].Trips.Trips[t].X = 0; }
        }
        vehicle_DisplayTrips(&vehicles[0]);

        /* Check general (2), (10) */
        t = vehicles[0].Trips.TripsCount;
        while(t-- > 0)
        {
            if (vehicles[0].Trips.Trips[t].X == 1)
            {
                if (! checkGeneral(&vehicles[0], &vehicles[0].Trips.Trips[t])) { break; }
            }
        }
    }

    // vehicles_CheckCapabilityIndividualTrip(vehicles, vehiclesCount, customers, customersCount);
    // vehicles_CheckValidTrips(vehicles, vehiclesCount, customers, customersCount);
    // vehicles_CheckUsable(vehicles, vehiclesCount, customers, customersCount);

    // Trips_t * nextTrips;

    // nextTrips = vehicle_GetNextTrips(&vehicles[1], NULL);
    // i = nextTrips->TripsCount;
    // while(i-- > 0) { printf("%d->%d\n", nextTrips->Trips[i].Start, nextTrips->Trips[i].End); }

    // nextTrips = vehicle_GetNextTrips(&vehicles[1], &nextTrips->Trips[i]);
    // i = nextTrips->TripsCount;
    // while(i-- > 0) { printf("%d->%d\n", nextTrips->Trips[j].Start, nextTrips->Trips[j].End); }

    // vehicles_DisplayTrips(vehicles, vehiclesCount);

    return 0;
}




Trips_t * vehicle_GetNextTrips(Vehicle_t *vehicle, Trip_t *trip)
{
	Trips_t * trips = calloc(1, sizeof(Trips_t));
    trips->Trips = calloc(vehicle->Trips.TripsCount, sizeof(Trip_t));
    trips->TripsCount = 0;

    if ((trips == NULL) || (trips->Trips == NULL))
    {
        printf("E: Cannot allocate memory to get next trips\n");
        return NULL;
    }

    uint32_t i = vehicle->Trips.TripsCount;
    while(i-- > 0)
    {
        if (vehicle->Trips.Trips[i].X == 1)
        {
            if (trip == NULL)
            {
                /* Find start trips */
                if ((vehicle->Trips.Trips[i].Start == 0) && (vehicle->Trips.Trips[i].End != 0))
                {
                    trips->Trips[trips->TripsCount].Start			= vehicle->Trips.Trips[i].Start;
                    trips->Trips[trips->TripsCount].End				= vehicle->Trips.Trips[i].End;
                    trips->Trips[trips->TripsCount].Distance		= vehicle->Trips.Trips[i].Distance;
                    trips->Trips[trips->TripsCount].PackageWeight	= vehicle->Trips.Trips[i].PackageWeight;
                    trips->TripsCount++;
                }
            }
            else
            {
                /* Find next trips */
                if (trip->End == vehicle->Trips.Trips[i].Start)
                {
                    trips->Trips[trips->TripsCount].Start			= vehicle->Trips.Trips[i].Start;
                    trips->Trips[trips->TripsCount].End				= vehicle->Trips.Trips[i].End;
                    trips->Trips[trips->TripsCount].Distance		= vehicle->Trips.Trips[i].Distance;
                    trips->Trips[trips->TripsCount].PackageWeight	= vehicle->Trips.Trips[i].PackageWeight;
                    trips->TripsCount++;
                }
            }
        }
    }

    return trips;
}

Trip_t * genTrips(Customer_t *customers, uint32_t customersCount)
{
    uint32_t totalTrips = customersCount * customersCount;

    /* Allocate memory to store trips list */
    Trip_t * trips = calloc(totalTrips, sizeof(Trip_t));

    if (trips == NULL)
    {
        printf("E: Cannot allocate memory for vehicle->Trips\n");
        return NULL;
    }

    /* Generate all possible trips */
    uint32_t i = customersCount;
    while(i-- > 0)
    {
        uint32_t j = customersCount;
        while(j-- > 0)
        {
            trips[i*customersCount + j].Start = i;
            trips[i*customersCount + j].End = j;
            trips[i*customersCount + j].Distance = customers[i].RelativeDistances[j];
            trips[i*customersCount + j].PackageWeight = customers[i].PackageWeight;
            trips[i*customersCount + j].X = 1;
        }
    }

    return trips;
}

Vehicle_t * getVehicles(uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount)
{
    /* Allocate memory */
    Vehicle_t * vehicles = calloc(vehiclesCount, sizeof(Vehicle_t));

    if (vehicles == NULL)
    {
        printf("E: Cannot allocate memory for vehicles\n");
        return NULL;
    }

    /* Get the input data */
    uint32_t k = vehiclesCount;
    while(k-- > 0)
    {
        vehicles[k].MaxDistance = VEHICLES[k].MaxDistance;
        vehicles[k].MaxCapacity = VEHICLES[k].MaxCapacity;
        vehicles[k].Price = VEHICLES[k].Price;

        /* Generate all possible trips for this vehicle */
        vehicles[k].Trips.TripsCount = customersCount * customersCount;
        vehicles[k].Trips.Trips = genTrips(customers, customersCount);
    }

    return vehicles;
}

Customer_t * getCustomers(uint32_t customersCount)
{
    /* Allocate memory to store customers list */
    Customer_t *customers = calloc(customersCount, sizeof(Customer_t));

    if (customers == NULL)
    {
        printf("E: Cannot allocate memory for customers\n");
        return NULL;
    }

    /* Get the customers data */
    uint32_t i = customersCount;
    while(i-- > 0)
    {
        /* Allocate memory to store relative distances list */
        customers[i].RelativeDistances = calloc(customersCount, sizeof(uint32_t));

        if (customers[i].RelativeDistances == NULL)
        {
            printf("E: Cannot allocate memory for customers[%d]->q\n", i);
            return NULL;
        }

        /* Get customer's relative distance to the others customers */
        uint32_t j = customersCount;
        while(j-- > 0) { customers[i].RelativeDistances[j] = CUSTOMERS[i].RelativeDistances[j]; }

        /* Get customer's package weight */
        customers[i].PackageWeight = CUSTOMERS[i].PackageWeight;
    }

    return customers;
}

void vehicles_CheckCapabilityIndividualTrip(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount)
{
    uint32_t k = vehiclesCount;
    while(k-- > 0)
    {
        uint32_t i = vehicles[k].Trips.TripsCount;
        while(i-- > 0)
        {
            if((vehicles[k].Trips.Trips[i].Distance > vehicles[k].MaxDistance) ||
                (vehicles[k].Trips.Trips[i].PackageWeight > vehicles[k].MaxCapacity))
            {
                vehicles[k].Trips.Trips[i].X = 0;
            }
        }
    }
}

bool vehicle_CheckDistanceLimitation(Vehicle_t *vehicle)
{
    uint32_t totalDistance = 0;

    uint32_t i = vehicle->Trips.TripsCount;
    while(i-- > 0) { if (vehicle->Trips.Trips[i].X == 1) { totalDistance += vehicle->Trips.Trips[i].Distance; } }

    if (totalDistance > vehicle->MaxDistance) { return false; }

    return true;
}

bool vehicle_CheckCapacityLimitation(Vehicle_t *vehicle)
{
    uint32_t totalCapacity = 0;

    uint32_t i = vehicle->Trips.TripsCount;
    while(i-- > 0) { if (vehicle->Trips.Trips[i].X == 1) { totalCapacity += vehicle->Trips.Trips[i].PackageWeight; } }

    if (totalCapacity > vehicle->MaxCapacity) { return false; }

    return true;
}

void vehicles_CheckValidTrips(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount)
{
    uint32_t k = vehiclesCount;
    while(k-- > 0)
    {
        uint32_t i = vehicles[k].Trips.TripsCount;
        while(i-- > 0)
        {
            /* A vehicle cannot start and finish at the same customer */
            if(((vehicles[k].Trips.Trips[i].Start + vehicles[k].Trips.Trips[i].End) != 0) &&
                (vehicles[k].Trips.Trips[i].Start == vehicles[k].Trips.Trips[i].End))
            {
                vehicles[k].Trips.Trips[i].X = 0;
            }
        }
    }
}

void vehicles_CheckUsable(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount)
{
    uint32_t k = vehiclesCount;
    while(k-- > 0)
        {
        bool hasStartAtStorage = false;
        bool hasFinishAtStorage = false;

        uint32_t i = vehicles[k].Trips.TripsCount;
        while(i-- > 0)
        {
            if (vehicles[k].Trips.Trips[i].X == 1)
            {
                /* A vehicle is usable only if it has a trip that start at the storage
                and it has another trip that finish at the storage */
                if (!hasStartAtStorage) { hasStartAtStorage = ((vehicles[k].Trips.Trips[i].Start == 0) && (vehicles[k].Trips.Trips[i].End != 0)); }
                if (!hasFinishAtStorage) { hasFinishAtStorage = ((vehicles[k].Trips.Trips[i].Start != 0) && (vehicles[k].Trips.Trips[i].End == 0)); }
            }
        }

        if (!hasStartAtStorage || !hasFinishAtStorage)
        {
            uint32_t i = vehicles[k].Trips.TripsCount;
            while(i-- > 0)
            {
                vehicles[k].Trips.Trips[i].X = 0;
            }
        }
    }
}

void vehicle_DisplayTrips(Vehicle_t *vehicle)
{
    uint32_t i = vehicle->Trips.TripsCount;
    while(i-- > 0)
    {
        if(vehicle->Trips.Trips[i].X == 1)
        {
            printf("%d->%d, ", vehicle->Trips.Trips[i].Start, vehicle->Trips.Trips[i].End);
        }
    }
    printf("\n");
}

void vehicles_DisplayTrips(Vehicle_t *vehicles, uint32_t vehiclesCount)
{
    uint32_t k = vehiclesCount;
    while(k-- > 0) { vehicle_DisplayTrips(&vehicles[k]); }
}
