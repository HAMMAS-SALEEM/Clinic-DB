CREATE TABLE patients(
    id serial PRIMARY KEY,
    name text,
    date_of_birth date
);

CREATE TABLE medical_histories(
    id serial PRIMARY KEY,
    admitted_at timestamp,
    patient_id int REFERENCES patients(id),
    status text
);

CREATE TABLE treatments(
    id serial PRIMARY KEY,
    type text,
    name text
);

CREATE TABLE treatment_medical_histories(
    med_history_id int CONSTRAINT med_history_FK REFERENCES medical_histories(id),
    treatments_id int CONSTRAINT treatments_FK REFERENCES treatments(id),
    PRIMARY KEY (med_history_id, treatments_id) 
);

CREATE TABLE invoices(
    id serial PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int CONSTRAINT invoices_medHistory_FK REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id serial PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int CONSTRAINT invoiceItem_invoices_FK REFERENCES invoices(id),
    treatments_id int CONSTRAINT invoiceItem_treatments_FK REFERENCES treatments(id)
);
