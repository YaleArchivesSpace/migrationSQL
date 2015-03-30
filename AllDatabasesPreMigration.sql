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
SET dateExpression  = REPLACE(dateExpression , 'ns2:', 'xlink:');

/* Clean up whitespace on indicators and barcodes */
Update ArchDescriptionInstances
set container1NumericIndicator=trim(container1NumericIndicator),
container1AlphaNumIndicator=trim(container1AlphaNumIndicator),
barcode=trim(barcode);

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

/* Changes Roman numerals in series identifiers to Arabic. 
This assumes that series identifiers only go to XXX. MSSA goes up to XXVIII */
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'I','1')
where subdivisionIdentifier like 'I';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'I.','1')
where subdivisionIdentifier like 'I.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'II','2')
where subdivisionIdentifier like 'II';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'II.','2')
where subdivisionIdentifier like 'II.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'III','3')
where subdivisionIdentifier like 'III';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'III.','3')
where subdivisionIdentifier like 'III.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IV','4')
where subdivisionIdentifier like 'IV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IV.','4')
where subdivisionIdentifier like 'IV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'V','5')
where subdivisionIdentifier like 'V';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'V.','5')
where subdivisionIdentifier like 'V.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VI','6')
where subdivisionIdentifier like 'VI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VI.','6')
where subdivisionIdentifier like 'VI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VII','7')
where subdivisionIdentifier like 'VII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VII.','7')
where subdivisionIdentifier like 'VII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VIII','8')
where subdivisionIdentifier like 'VIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VIII.','8')
where subdivisionIdentifier like 'VIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IX','9')
where subdivisionIdentifier like 'IX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IX.','9')
where subdivisionIdentifier like 'IX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'X','10')
where subdivisionIdentifier like 'X';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'X.','10')
where subdivisionIdentifier like 'X.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XI','11')
where subdivisionIdentifier like 'XI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XI.','11')
where subdivisionIdentifier like 'XI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XII','12')
where subdivisionIdentifier like 'XII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XII.','12')
where subdivisionIdentifier like 'XII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIII','13')
where subdivisionIdentifier like 'XIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIII.','13')
where subdivisionIdentifier like 'XIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIV','14')
where subdivisionIdentifier like 'XIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIV.','14')
where subdivisionIdentifier like 'XIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XV','15')
where subdivisionIdentifier like 'XV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XV.','15')
where subdivisionIdentifier like 'XV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVI','16')
where subdivisionIdentifier like 'XVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVI.','16')
where subdivisionIdentifier like 'XVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVII','17')
where subdivisionIdentifier like 'XVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVII.','17')
where subdivisionIdentifier like 'XVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVIII','18')
where subdivisionIdentifier like 'XVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVIII.','18')
where subdivisionIdentifier like 'XVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIX','19')
where subdivisionIdentifier like 'XIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIX.','19')
where subdivisionIdentifier like 'XIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XX','20')
where subdivisionIdentifier like 'XX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XX.','20')
where subdivisionIdentifier like 'XX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXI','21')
where subdivisionIdentifier like 'XXI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXI.','21')
where subdivisionIdentifier like 'XXI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXII','22')
where subdivisionIdentifier like 'XXII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXII.','22')
where subdivisionIdentifier like 'XXII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIII','23')
where subdivisionIdentifier like 'XXIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIII.','23')
where subdivisionIdentifier like 'XXIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIV','24')
where subdivisionIdentifier like 'XXIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIV.','24')
where subdivisionIdentifier like 'XXIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXV','25')
where subdivisionIdentifier like 'XXV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXV.','25')
where subdivisionIdentifier like 'XXV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVI','26')
where subdivisionIdentifier like 'XXVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVI.','26')
where subdivisionIdentifier like 'XXVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVII','27')
where subdivisionIdentifier like 'XXVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVII.','27')
where subdivisionIdentifier like 'XXVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVIII','28')
where subdivisionIdentifier like 'XXVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVIII.','28')
where subdivisionIdentifier like 'XXVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIX','29')
where subdivisionIdentifier like 'XXIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIX.','29')
where subdivisionIdentifier like 'XXIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXX','30')
where subdivisionIdentifier like 'XXX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXX.','30')
where subdivisionIdentifier like 'XXX.';
