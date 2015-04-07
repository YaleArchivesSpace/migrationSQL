update archival_object
set component_id = replace(component_id, 'Series','');
update archival_object
set component_id = replace(component_id, 'SERIES','');
update archival_object
set component_id = replace(component_id, 'Subseries','');
update archival_object
set component_id = replace(component_id, 'SUBSERIES','');
update archival_object
set component_id = trim(component_id);
