
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
        .MaxDistance = 400,
        .MaxCapacity = 15000,
        .Price = 100,
        .Trips =
        {
         .Trips = NULL,
         .TripsCount = 0
        }
    },
    {
        .MaxDistance = 200,
        .MaxCapacity = 30000,
        .Price = 70,
        .Trips =
        {
         .Trips = NULL,
         .TripsCount = 0
        }
    },
    {
        .MaxDistance = 500,
        .MaxCapacity = 80000,
        .Price = 100,
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
        .PackageWeight = 8000
    },
    {
        .RelativeDistances = DISTANCE[2],
        .PackageWeight = 2000
    },
    {
        .RelativeDistances = DISTANCE[3],
        .PackageWeight = 600
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
bool checkGeneral(Vehicle_t *vehicle);
bool checkContinuousRoute(Vehicle_t *vehicle, uint32_t customersCount);
bool checkDistanceLimit(Vehicle_t *vehicle, uint32_t customersCount);
bool checkCapacityLimit(Vehicle_t *vehicle, uint32_t customersCount);
bool check8(Vehicle_t *vehicle, uint32_t customersCount);
bool check9(Vehicle_t *vehicle, uint32_t customersCount);

Vehicle_t *vehicles;
Customer_t *customers;

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
        bool generalCheckPass = false;
		bool continuousCheckPass = false;
		bool distanceCheckPass = false;
		bool capacityCheckPass = false;
		bool oneTimeVehicleUsageCheckPass = false;
		bool check8Pass = false;
		bool check9Pass = false;

        t = vehicles[0].Trips.TripsCount;
        while(t-- > 0)
        {
            /* i = j; i,j # 0 */
            if ((vehicles[0].Trips.Trips[t].Start != 0) &&
                (vehicles[0].Trips.Trips[t].Start == vehicles[0].Trips.Trips[t].End))
            { vehicles[0].Trips.Trips[t].X = 0; }
            else { vehicles[0].Trips.Trips[t].X = (c & (1 << t)) >> t; }
        }

        generalCheckPass = checkGeneral(&vehicles[0]);
		continuousCheckPass = checkContinuousRoute(&vehicles[0], customersCount);
		distanceCheckPass = checkDistanceLimit(&vehicles[0], customersCount);
		capacityCheckPass = checkCapacityLimit(&vehicles[0], customersCount);
		check8Pass = check8(&vehicles[0], customersCount);
		check9Pass = check9(&vehicles[0], customersCount);

		if (generalCheckPass &&
			continuousCheckPass &&
			distanceCheckPass &&
			capacityCheckPass &&
			check8Pass &&
			check9Pass)
		{
        	vehicle_DisplayTrips(&vehicles[0]);
		}
    }

    return 0;
}

bool check8(Vehicle_t *vehicle, uint32_t customersCount)
{
	uint32_t sumj = 0;

	uint32_t j = customersCount;
	while(j-- > 1) { sumj += vehicle->Trips.Trips[j].X; }

	if (sumj > 1)
	{
		// vehicle_DisplayTrips(vehicle);
		// printf("Fail 8\n");
		return false;
	}

	return true;
}

bool check9(Vehicle_t *vehicle, uint32_t customersCount)
{
	uint32_t sumi = 0;

	uint32_t i = customersCount;
	while(i-- > 1) { sumi += vehicle->Trips.Trips[i*customersCount].X; }

	if (sumi > 1)
	{
		// vehicle_DisplayTrips(vehicle);
		// printf("Fail 9\n");
		return false;
	}

	return true;
}

bool checkCapacityLimit(Vehicle_t *vehicle, uint32_t customersCount)
{
	uint32_t sumi = 0;
	
	uint32_t i = customersCount;
	while(i-- > 0)
	{
		uint32_t sumj = 0;

		uint32_t j = customersCount;
		while(j-- > 0) { sumj += vehicle->Trips.Trips[i*customersCount + j].PackageWeight * vehicle->Trips.Trips[i*customersCount + j].X; }

		sumi += sumj;
	}

	if (sumi > vehicle->MaxCapacity)
	{
		// printf("Fail capacity: %d > %d\n", sumi, vehicle->MaxCapacity);
		return false;
	}
	
	return true;
}

bool checkDistanceLimit(Vehicle_t *vehicle, uint32_t customersCount)
{
	uint32_t sumi = 0;
	
	uint32_t i = customersCount;
	while(i-- > 0)
	{
		uint32_t sumj = 0;

		uint32_t j = customersCount;
		while(j-- > 0) { sumj += vehicle->Trips.Trips[i*customersCount + j].Distance * vehicle->Trips.Trips[i*customersCount + j].X; }

		sumi += sumj;
	}

	if (sumi > vehicle->MaxDistance)
	{
		// printf("Fail distance: %d > %d\n", sumi, vehicle->MaxDistance);
		return false;
	}
	
	return true;
}

bool checkContinuousRoute(Vehicle_t *vehicle, uint32_t customersCount)
{
    uint32_t t = customersCount;
	while(t-- > 1)
	{
		uint32_t sumi = 0;
		uint32_t i = customersCount;
		while(i-- > 0) { sumi += vehicle->Trips.Trips[i*customersCount + t].X; }

		uint32_t sumj = 0;
		uint32_t j = customersCount;
		while(j-- > 0) { sumj += vehicle->Trips.Trips[t*customersCount + j].X; }

		if ((sumi - sumj) != 0)
		{
			// printf("Fail continuous: %d - %d\n", sumi, sumj);
			return false;
		}
	}

	return true;
}

bool checkGeneral(Vehicle_t *vehicle)
{
    uint32_t t = vehicle->Trips.TripsCount;
    while(t-- > 1) // Not go to t = 0 because there is no "the rest" if t = 0
    {
        /* 1st, pick up X = 1 trips */
        if (vehicles[0].Trips.Trips[t].X == 1)
        {
            /* Next, compare it with the rest of trips */
            uint32_t t1 = t;
			// printf("t = %d, t1 = %d\n", t, t1);
            while(t1-- > 0)
            {
                /* Only compare with X = 1 trips */
                if (vehicle->Trips.Trips[t1].X == 1)
                {
                    // /* Skip for the storage */
                    // if ((vehicle->Trips.Trips[t1].Start == 0) &&
                    //     (vehicle->Trips.Trips[t1].End == 0))
                    // { return true; }

                    /* This condition would fail if trip[t1] is reverse with trip[t] */
                    if ((vehicle->Trips.Trips[t1].Start == vehicle->Trips.Trips[t].End) &&
                        (vehicle->Trips.Trips[t1].End == vehicle->Trips.Trips[t].Start))
                    {
						// vehicle_DisplayTrips(vehicle);
						// printf("Fail general: %d->%d,  %d->%d, %d vs. %d\n",
						// 	vehicle->Trips.Trips[t].Start, vehicle->Trips.Trips[t].End,
						// 	vehicle->Trips.Trips[t1].Start, vehicle->Trips.Trips[t1].End,
						// 	t, t1);
						return false;
					}
                }
            }
        }
    }

    return true;
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
            if (trips[i*customersCount + j].End != 0) { trips[i*customersCount + j].PackageWeight = customers[i].PackageWeight; }
			else { trips[i*customersCount + j].PackageWeight = 0; } // The return trip
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

void vehicle_DisplayTrips(Vehicle_t *vehicle)
{
	uint32_t i = vehicle->Trips.TripsCount;
	while(i-- > 0)
	{
		if(vehicle->Trips.Trips[i].X == 1)
		{
			printf("%d->%d\t", vehicle->Trips.Trips[i].Start, vehicle->Trips.Trips[i].End);
		}
	}

	printf("\n");
}

void vehicles_DisplayTrips(Vehicle_t *vehicles, uint32_t vehiclesCount)
{
    uint32_t k = vehiclesCount;
    while(k-- > 0) { vehicle_DisplayTrips(&vehicles[k]); }
}
