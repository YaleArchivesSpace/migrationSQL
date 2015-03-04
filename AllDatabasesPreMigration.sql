/* Change NS2 to xlink */
UPDATE Events
SET eventDescription = REPLACE(eventDescription, 'ns2:', 'xlink:');
UPDATE ArchDescriptionRepeatingData
SET noteContent = REPLACE(noteContent, 'ns2:', 'xlink:');
UPDATE DigitalObjects
SET title = REPLACE(title, 'ns2:', 'xlink:');
UPDATE IndexItems
SET reference = REPLACE(reference, 'ns2:', 'xlink:');
UPDATE IndexItems
SET referenceText = REPLACE(referenceText, 'ns2:', 'xlink:');
UPDATE ListDefinitionItems
SET itemValue = REPLACE(itemValue, 'ns2:', 'xlink:');
UPDATE ListDefinitionItems
SET label = REPLACE(label, 'ns2:', 'xlink:');
UPDATE ListOrderedItems
SET itemValue = REPLACE(itemValue, 'ns2:', 'xlink:');
UPDATE Resources
SET title = REPLACE(title, 'ns2:', 'xlink:');
UPDATE ResourcesComponents
SET title = REPLACE(title, 'ns2:', 'xlink:');
UPDATE Resources
SET dateExpression = REPLACE(dateExpression, 'ns2:', 'xlink:');
UPDATE ResourcesComponents
SET dateExpression  = REPLACE(dateExpression , 'ns2:', 'xlink:')

/* Clean up series identifiers */
/* This looks for the string "series" in the component unique identifier and makes sure that the level is series. */
Update ResourcesComponents
Set resourceLevel = 'series'
where subdivisionIdentifier like 'Series%';
/* This looks for the string "subseries" in the component unique identifier and makes sure that the level is subseries. */
Update ResourcesComponents
Set resourceLevel = 'subseries'
where subdivisionIdentifier like 'Subseries%';
/* This strips the string "Series" (or series all caps) from the component unique identifier */
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'Series', '');
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'SERIES', '');
/* This trims any leading or trailing whitespace from the component unique identifier */
Update ResourcesComponents
Set subdivisionIdentifier = trim(subdivisionIdentifier);
