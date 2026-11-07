# Database Design Notes

## Design basis

This initial schema is based on the six entities and attributes visible in the ER diagram supplied by the group. It is a starting point for review, not a claim that all lecturer requirements have been finalized.

## Relationship interpretation

1. `airlines` to `flights`: one airline may operate zero or many flights; each flight references one airline.
2. `gates` to `flights`: one gate may be used by zero or many flights over time; each flight references one gate. The model does not yet prevent overlapping flight assignments at a gate.
3. `flights` to `tickets`: one flight may have zero or many tickets; each ticket references one flight.
4. `passengers` to `tickets`: one passenger may have zero or many tickets; each ticket references one passenger.
5. `tickets` to `check_ins`: each ticket may have zero or one check-in; each check-in references exactly one ticket. `UNIQUE(ticket_id)` enforces at most one check-in per ticket.

## Constraints

- Primary keys use unsigned auto-increment integer identifiers.
- Foreign keys use InnoDB and restrict deletion of referenced parent records.
- Passport number and booking reference are unique.
- A seat number is unique within a flight.
- Arrival time must be later than departure time.
- Status columns use enumerated values as an initial controlled vocabulary.

## Assumptions to validate with the lecturer

- Whether a flight should have one gate or multiple gate assignments.
- Whether flight numbers need to be unique per airline and service date.
- Whether check-in records require a check-in counter or staff member.
- Whether passengers can book multiple seats on the same flight.
- Whether additional entities (aircraft, terminals, destinations, baggage, payments) are required.
- Whether the lecturer expects sample data and a minimum number of SQL queries.

## Data protection

Use fictional demonstration data only. Never commit real passport numbers or private passenger details to a public repository.
