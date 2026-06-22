CREATE TABLE airline_metric_changes (
    company_id INT NOT NULL,
    period_start INT NOT NULL,
    period_end INT NOT NULL,
    airport_passenger_traffic_change DECIMAL(10,2),
    passengers_change DECIMAL(10,2),
    flights_change DECIMAL(10,2),
    load_factor_change DECIMAL(10,2)
);