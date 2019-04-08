
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct __Trip
{
    uint32_t    Start;
    uint32_t    End;
    uint32_t    Distance;
    uint32_t    PackageWeight;
    uint32_t    X;
} Trip_t;

typedef struct __Vehicle
{
    uint32_t    MaxDistance;
    uint32_t    MaxCapacity;
    uint32_t    Price;
    Trip_t      *Trips;
    uint32_t    TripsCount;
} Vehicle_t;

typedef struct __Customer
{
    uint32_t    *RelativeDistances;
    uint32_t    PackageWeight;
} Customer_t;

#define N   10
#define K   7

uint32_t DISTANCE[N][N] =
{
    { 0,    19, 82, 88, 39, 51, 61, 18, 96, 97 },
    { 91,   0,  60, 73, 30, 17, 86, 18, 92, 96 },
    { 60,   30, 0,  85, 39, 88, 95, 57, 70, 56 },
    { 61,   28, 63, 0,  64, 65, 41, 80, 95, 34 },
    { 15,   35, 22, 70, 0,  53, 37, 47, 34, 10 },
    { 29,   55, 88, 56, 40, 0,  61, 65, 12, 11 },
    { 34,   18, 52, 81, 47, 60, 0,  81, 99, 60 },
    { 70,   16, 99, 17, 44, 68, 19, 0,  10, 37 },
    { 85,   32, 32, 75, 29, 87, 19, 63, 0,  12 },
    { 58,   17, 93, 23, 44, 56, 36, 93, 59, 0 }
};

Vehicle_t VEHICLES[K] =
{
    {
        .MaxDistance = 65,
        .MaxCapacity = 23423,
        .Price = 30,
        .Trips = NULL,
        .TripsCount = 0
    },
    {
        .MaxDistance = 38,
        .MaxCapacity = 534534,
        .Price = 77,
        .Trips = NULL,
        .TripsCount = 0
    },
    {
        .MaxDistance = 100,
        .MaxCapacity = 2342,
        .Price = 30,
        .Trips = NULL,
        .TripsCount = 0
    },
    {
        .MaxDistance = 142,
        .MaxCapacity = 56575,
        .Price = 76,
        .Trips = NULL,
        .TripsCount = 0
    },
    {
        .MaxDistance = 45,
        .MaxCapacity = 2131,
        .Price = 12,
        .Trips = NULL,
        .TripsCount = 0
    },
    {
        .MaxDistance = 98,
        .MaxCapacity = 867,
        .Price = 98,
        .Trips = NULL,
        .TripsCount = 0
    },
    {
        .MaxDistance = 242,
        .MaxCapacity = 13123,
        .Price = 79,
        .Trips = NULL,
        .TripsCount = 0
    }
};

Customer_t CUSTOMERS[N] =
{
    {
        .RelativeDistances = DISTANCE[0],
        .PackageWeight = 2000
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
    },
    {
        .RelativeDistances = DISTANCE[4],
        .PackageWeight = 12312
    },
    {
        .RelativeDistances = DISTANCE[5],
        .PackageWeight = 8723
    },
    {
        .RelativeDistances = DISTANCE[6],
        .PackageWeight = 97
    },
    {
        .RelativeDistances = DISTANCE[7],
        .PackageWeight = 123
    },
    {
        .RelativeDistances = DISTANCE[8],
        .PackageWeight = 35376
    },
    {
        .RelativeDistances = DISTANCE[9],
        .PackageWeight = 1237
    }
};

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

    return 0;
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
        vehicles[k].TripsCount = customersCount * customersCount;
        vehicles[k].Trips = genTrips(customers, customersCount);
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

void checkDistanceLimit(Vehicle_t *vehicles, uint32_t vehiclesCount, Customer_t *customers, uint32_t customersCount)
{
    uint32_t k = vehiclesCount;
    while(k-- > 0)
    {
        uint32_t i = customersCount;
        while(i-- > 0)
        {
            uint32_t j = customersCount;
            while(j-- > 0)
            {
                if(vehicles[k].Trips[i*customersCount + j].Distance > vehicles[k].MaxDistance)
                {
                    vehicles[k].Trips[i*customersCount + j].X = 0;
                }
            }
        }
    }
}

void displayTrips(Vehicle_t *vehicle)
{
    uint32_t i = vehicle->TripsCount;
    while(i-- > 0)
    {
		printf("vehicle->Trips[i].Start = %d\n", vehicle->Trips[i].Start);
        // printf("Trip: %d-->%d, Distance: %d, Weight: %d\n",
        //        vehicle->Trips[i].Start,
        //        vehicle->Trips[i].End,
        //        vehicle->Trips[i].Distance,
        //        vehicle->Trips[i].PackageWeight);
    }
}

Vehicle_t *vehicles;
Customer_t *customers;

int main(void)
{
    uint32_t i, j, k;
    uint32_t customersCount = N;
    uint32_t vehiclesCount = K;

    /* Get vehicles list and customers list */
    customers = getCustomers(customersCount);
    vehicles = getVehicles(vehiclesCount, customers, customersCount);

    displayTrips(&vehicles[0]);

    return 0;
}


