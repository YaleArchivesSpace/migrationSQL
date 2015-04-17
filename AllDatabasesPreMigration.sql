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
container2NumericIndicator=trim(container1NumericIndicator),
container2AlphaNumIndicator=trim(container1AlphaNumIndicator),
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
This assumes that series identifiers only go to C. MSSA goes up to XXVIII */
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'I','1')
where subdivisionIdentifier like 'I';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'I.','1')
where subdivisionIdentifier like 'I.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'I:','1')
where subdivisionIdentifier like 'I:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'II','2')
where subdivisionIdentifier like 'II';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'II.','2')
where subdivisionIdentifier like 'II.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'II:','2')
where subdivisionIdentifier like 'II:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'III','3')
where subdivisionIdentifier like 'III';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'III.','3')
where subdivisionIdentifier like 'III.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'III:','3')
where subdivisionIdentifier like 'III:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IV','4')
where subdivisionIdentifier like 'IV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IV.','4')
where subdivisionIdentifier like 'IV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IV:','4')
where subdivisionIdentifier like 'IV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'V','5')
where subdivisionIdentifier like 'V';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'V.','5')
where subdivisionIdentifier like 'V.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'V:','5')
where subdivisionIdentifier like 'V:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VI','6')
where subdivisionIdentifier like 'VI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VI.','6')
where subdivisionIdentifier like 'VI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VI:','6')
where subdivisionIdentifier like 'VI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VII','7')
where subdivisionIdentifier like 'VII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VII.','7')
where subdivisionIdentifier like 'VII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VII:','7')
where subdivisionIdentifier like 'VII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VIII','8')
where subdivisionIdentifier like 'VIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VIII.','8')
where subdivisionIdentifier like 'VIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'VIII:','8')
where subdivisionIdentifier like 'VIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IX','9')
where subdivisionIdentifier like 'IX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IX.','9')
where subdivisionIdentifier like 'IX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'IX:','9')
where subdivisionIdentifier like 'IX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'X','10')
where subdivisionIdentifier like 'X';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'X.','10')
where subdivisionIdentifier like 'X.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'X:','10')
where subdivisionIdentifier like 'X:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XI','11')
where subdivisionIdentifier like 'XI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XI.','11')
where subdivisionIdentifier like 'XI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XI:','11')
where subdivisionIdentifier like 'XI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XII','12')
where subdivisionIdentifier like 'XII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XII.','12')
where subdivisionIdentifier like 'XII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XII:','12')
where subdivisionIdentifier like 'XII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIII','13')
where subdivisionIdentifier like 'XIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIII.','13')
where subdivisionIdentifier like 'XIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIII:','13')
where subdivisionIdentifier like 'XIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIV','14')
where subdivisionIdentifier like 'XIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIV.','14')
where subdivisionIdentifier like 'XIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIV:','14')
where subdivisionIdentifier like 'XIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XV','15')
where subdivisionIdentifier like 'XV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XV.','15')
where subdivisionIdentifier like 'XV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XV:','15')
where subdivisionIdentifier like 'XV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVI','16')
where subdivisionIdentifier like 'XVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVI.','16')
where subdivisionIdentifier like 'XVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVI:','16')
where subdivisionIdentifier like 'XVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVII','17')
where subdivisionIdentifier like 'XVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVII.','17')
where subdivisionIdentifier like 'XVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVII:','17')
where subdivisionIdentifier like 'XVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVIII','18')
where subdivisionIdentifier like 'XVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVIII.','18')
where subdivisionIdentifier like 'XVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XVIII:','18')
where subdivisionIdentifier like 'XVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIX','19')
where subdivisionIdentifier like 'XIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIX.','19')
where subdivisionIdentifier like 'XIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XIX:','19')
where subdivisionIdentifier like 'XIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XX','20')
where subdivisionIdentifier like 'XX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XX.','20')
where subdivisionIdentifier like 'XX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XX:','20')
where subdivisionIdentifier like 'XX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXI','21')
where subdivisionIdentifier like 'XXI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXI.','21')
where subdivisionIdentifier like 'XXI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXI:','21')
where subdivisionIdentifier like 'XXI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXII','22')
where subdivisionIdentifier like 'XXII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXII.','22')
where subdivisionIdentifier like 'XXII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXII:','22')
where subdivisionIdentifier like 'XXII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIII','23')
where subdivisionIdentifier like 'XXIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIII.','23')
where subdivisionIdentifier like 'XXIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIII:','23')
where subdivisionIdentifier like 'XXIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIV','24')
where subdivisionIdentifier like 'XXIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIV.','24')
where subdivisionIdentifier like 'XXIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIV:','24')
where subdivisionIdentifier like 'XXIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXV','25')
where subdivisionIdentifier like 'XXV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXV.','25')
where subdivisionIdentifier like 'XXV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXV:','25')
where subdivisionIdentifier like 'XXV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVI','26')
where subdivisionIdentifier like 'XXVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVI.','26')
where subdivisionIdentifier like 'XXVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVI:','26')
where subdivisionIdentifier like 'XXVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVII','27')
where subdivisionIdentifier like 'XXVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVII.','27')
where subdivisionIdentifier like 'XXVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVII:','27')
where subdivisionIdentifier like 'XXVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVIII','28')
where subdivisionIdentifier like 'XXVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVIII.','28')
where subdivisionIdentifier like 'XXVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXVIII:','28')
where subdivisionIdentifier like 'XXVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIX','29')
where subdivisionIdentifier like 'XXIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIX.','29')
where subdivisionIdentifier like 'XXIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXIX:','29')
where subdivisionIdentifier like 'XXIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXX','30')
where subdivisionIdentifier like 'XXX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXX.','30')
where subdivisionIdentifier like 'XXX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXX:','30')
where subdivisionIdentifier like 'XXX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXI','31')
where subdivisionIdentifier like 'XXXI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXI.','31')
where subdivisionIdentifier like 'XXXI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXI:','31')
where subdivisionIdentifier like 'XXXI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXII','32')
where subdivisionIdentifier like 'XXXII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXII.','32')
where subdivisionIdentifier like 'XXXII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXII:','32')
where subdivisionIdentifier like 'XXXII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIII','33')
where subdivisionIdentifier like 'XXXIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIII.','33')
where subdivisionIdentifier like 'XXXIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIII:','33')
where subdivisionIdentifier like 'XXXIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIV','34')
where subdivisionIdentifier like 'XXXIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIV.','34')
where subdivisionIdentifier like 'XXXIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIV:','34')
where subdivisionIdentifier like 'XXXIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXV','35')
where subdivisionIdentifier like 'XXXV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXV.','35')
where subdivisionIdentifier like 'XXXV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXV:','35')
where subdivisionIdentifier like 'XXXV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVI','36')
where subdivisionIdentifier like 'XXXVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVI.','36')
where subdivisionIdentifier like 'XXXVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVI:','36')
where subdivisionIdentifier like 'XXXVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVII','37')
where subdivisionIdentifier like 'XXXVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVII.','37')
where subdivisionIdentifier like 'XXXVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVII:','37')
where subdivisionIdentifier like 'XXXVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVIII','38')
where subdivisionIdentifier like 'XXXVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVIII.','38')
where subdivisionIdentifier like 'XXXVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXVIII:','38')
where subdivisionIdentifier like 'XXXVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIX','39')
where subdivisionIdentifier like 'XXXIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIX.','39')
where subdivisionIdentifier like 'XXXIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XXXIX:','39')
where subdivisionIdentifier like 'XXXIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XL','40')
where subdivisionIdentifier like 'XL';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XL.','40')
where subdivisionIdentifier like 'XL.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XL:','40')
where subdivisionIdentifier like 'XL:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLI','41')
where subdivisionIdentifier like 'XLI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLI.','41')
where subdivisionIdentifier like 'XLI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLI:','41')
where subdivisionIdentifier like 'XLI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLII','42')
where subdivisionIdentifier like 'XLII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLII.','42')
where subdivisionIdentifier like 'XLII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLII:','42')
where subdivisionIdentifier like 'XLII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIII','43')
where subdivisionIdentifier like 'XLIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIII.','43')
where subdivisionIdentifier like 'XLIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIII:','43')
where subdivisionIdentifier like 'XLIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIV','44')
where subdivisionIdentifier like 'XLIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIV.','44')
where subdivisionIdentifier like 'XLIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIV:','44')
where subdivisionIdentifier like 'XLIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLV','45')
where subdivisionIdentifier like 'XLV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLV.','45')
where subdivisionIdentifier like 'XLV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLV:','45')
where subdivisionIdentifier like 'XLV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVI','46')
where subdivisionIdentifier like 'XLVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVI.','46')
where subdivisionIdentifier like 'XLVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVI:','46')
where subdivisionIdentifier like 'XLVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVII','47')
where subdivisionIdentifier like 'XLVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVII.','47')
where subdivisionIdentifier like 'XLVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVII:','47')
where subdivisionIdentifier like 'XLVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVIII','48')
where subdivisionIdentifier like 'XLVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVIII.','48')
where subdivisionIdentifier like 'XLVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLVIII:','48')
where subdivisionIdentifier like 'XLVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIX','49')
where subdivisionIdentifier like 'XLIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIX.','49')
where subdivisionIdentifier like 'XLIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XLIX:','49')
where subdivisionIdentifier like 'XLIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'L','50')
where subdivisionIdentifier like 'L';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'L.','50')
where subdivisionIdentifier like 'L.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'L:','50')
where subdivisionIdentifier like 'L:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LI','51')
where subdivisionIdentifier like 'LI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LI.','51')
where subdivisionIdentifier like 'LI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LI:','51')
where subdivisionIdentifier like 'LI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LII','52')
where subdivisionIdentifier like 'LII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LII.','52')
where subdivisionIdentifier like 'LII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LII:','52')
where subdivisionIdentifier like 'LII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIII','53')
where subdivisionIdentifier like 'LIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIII.','53')
where subdivisionIdentifier like 'LIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIII:','53')
where subdivisionIdentifier like 'LIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIV','54')
where subdivisionIdentifier like 'LIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIV.','54')
where subdivisionIdentifier like 'LIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIV:','54')
where subdivisionIdentifier like 'LIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LV','55')
where subdivisionIdentifier like 'LV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LV.','55')
where subdivisionIdentifier like 'LV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LV:','55')
where subdivisionIdentifier like 'LV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVI','56')
where subdivisionIdentifier like 'LVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVI.','56')
where subdivisionIdentifier like 'LVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVI:','56')
where subdivisionIdentifier like 'LVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVII','57')
where subdivisionIdentifier like 'LVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVII.','57')
where subdivisionIdentifier like 'LVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVII:','57')
where subdivisionIdentifier like 'LVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVIII','58')
where subdivisionIdentifier like 'LVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVIII.','58')
where subdivisionIdentifier like 'LVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LVIII:','58')
where subdivisionIdentifier like 'LVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIX','59')
where subdivisionIdentifier like 'LIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIX.','59')
where subdivisionIdentifier like 'LIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LIX:','59')
where subdivisionIdentifier like 'LIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LX','60')
where subdivisionIdentifier like 'LX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LX.','60')
where subdivisionIdentifier like 'LX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LX:','60')
where subdivisionIdentifier like 'LX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXI','61')
where subdivisionIdentifier like 'LXI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXI.','61')
where subdivisionIdentifier like 'LXI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXI:','61')
where subdivisionIdentifier like 'LXI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXII','62')
where subdivisionIdentifier like 'LXII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXII.','62')
where subdivisionIdentifier like 'LXII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXII:','62')
where subdivisionIdentifier like 'LXII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIII','63')
where subdivisionIdentifier like 'LXIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIII.','63')
where subdivisionIdentifier like 'LXIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIII:','63')
where subdivisionIdentifier like 'LXIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIV','64')
where subdivisionIdentifier like 'LXIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIV.','64')
where subdivisionIdentifier like 'LXIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIV:','64')
where subdivisionIdentifier like 'LXIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXV','65')
where subdivisionIdentifier like 'LXV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXV.','65')
where subdivisionIdentifier like 'LXV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXV:','65')
where subdivisionIdentifier like 'LXV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVI','66')
where subdivisionIdentifier like 'LXVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVI.','66')
where subdivisionIdentifier like 'LXVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVI:','66')
where subdivisionIdentifier like 'LXVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVII','67')
where subdivisionIdentifier like 'LXVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVII.','67')
where subdivisionIdentifier like 'LXVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVII:','67')
where subdivisionIdentifier like 'LXVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVIII','68')
where subdivisionIdentifier like 'LXVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVIII.','68')
where subdivisionIdentifier like 'LXVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXVIII:','68')
where subdivisionIdentifier like 'LXVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIX','69')
where subdivisionIdentifier like 'LXIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIX.','69')
where subdivisionIdentifier like 'LXIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXIX:','69')
where subdivisionIdentifier like 'LXIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXX','70')
where subdivisionIdentifier like 'LXX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXX.','70')
where subdivisionIdentifier like 'LXX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXX:','70')
where subdivisionIdentifier like 'LXX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXI','71')
where subdivisionIdentifier like 'LXXI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXI.','71')
where subdivisionIdentifier like 'LXXI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXI:','71')
where subdivisionIdentifier like 'LXXI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXII','72')
where subdivisionIdentifier like 'LXXII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXII.','72')
where subdivisionIdentifier like 'LXXII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXII:','72')
where subdivisionIdentifier like 'LXXII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIII','73')
where subdivisionIdentifier like 'LXXIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIII.','73')
where subdivisionIdentifier like 'LXXIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIII:','73')
where subdivisionIdentifier like 'LXXIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIV','74')
where subdivisionIdentifier like 'LXXIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIV.','74')
where subdivisionIdentifier like 'LXXIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIV:','74')
where subdivisionIdentifier like 'LXXIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXV','75')
where subdivisionIdentifier like 'LXXV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXV.','75')
where subdivisionIdentifier like 'LXXV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXV:','75')
where subdivisionIdentifier like 'LXXV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVI','76')
where subdivisionIdentifier like 'LXXVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVI.','76')
where subdivisionIdentifier like 'LXXVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVI:','76')
where subdivisionIdentifier like 'LXXVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVII','77')
where subdivisionIdentifier like 'LXXVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVII.','77')
where subdivisionIdentifier like 'LXXVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVII:','77')
where subdivisionIdentifier like 'LXXVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVIII','78')
where subdivisionIdentifier like 'LXXVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVIII.','78')
where subdivisionIdentifier like 'LXXVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXVIII:','78')
where subdivisionIdentifier like 'LXXVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIX','79')
where subdivisionIdentifier like 'LXXIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIX.','79')
where subdivisionIdentifier like 'LXXIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXIX:','79')
where subdivisionIdentifier like 'LXXIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXX','80')
where subdivisionIdentifier like 'LXXX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXX.','80')
where subdivisionIdentifier like 'LXXX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXX:','80')
where subdivisionIdentifier like 'LXXX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXI','81')
where subdivisionIdentifier like 'LXXXI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXI.','81')
where subdivisionIdentifier like 'LXXXI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXI:','81')
where subdivisionIdentifier like 'LXXXI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXII','82')
where subdivisionIdentifier like 'LXXXII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXII.','82')
where subdivisionIdentifier like 'LXXXII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXII:','82')
where subdivisionIdentifier like 'LXXXII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIII','83')
where subdivisionIdentifier like 'LXXXIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIII.','83')
where subdivisionIdentifier like 'LXXXIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIII:','83')
where subdivisionIdentifier like 'LXXXIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIV','84')
where subdivisionIdentifier like 'LXXXIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIV.','84')
where subdivisionIdentifier like 'LXXXIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIV:','84')
where subdivisionIdentifier like 'LXXXIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXV','85')
where subdivisionIdentifier like 'LXXXV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXV.','85')
where subdivisionIdentifier like 'LXXXV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXV:','85')
where subdivisionIdentifier like 'LXXXV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVI','86')
where subdivisionIdentifier like 'LXXXVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVI.','86')
where subdivisionIdentifier like 'LXXXVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVI:','86')
where subdivisionIdentifier like 'LXXXVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVII','87')
where subdivisionIdentifier like 'LXXXVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVII.','87')
where subdivisionIdentifier like 'LXXXVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVII:','87')
where subdivisionIdentifier like 'LXXXVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVIII','88')
where subdivisionIdentifier like 'LXXXVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVIII.','88')
where subdivisionIdentifier like 'LXXXVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXVIII:','88')
where subdivisionIdentifier like 'LXXXVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIX','89')
where subdivisionIdentifier like 'LXXXIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIX.','89')
where subdivisionIdentifier like 'LXXXIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'LXXXIX:','89')
where subdivisionIdentifier like 'LXXXIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XC','90')
where subdivisionIdentifier like 'XC';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XC.','90')
where subdivisionIdentifier like 'XC.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XC:','90')
where subdivisionIdentifier like 'XC:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCI','91')
where subdivisionIdentifier like 'XCI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCI.','91')
where subdivisionIdentifier like 'XCI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCI:','91')
where subdivisionIdentifier like 'XCI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCII','92')
where subdivisionIdentifier like 'XCII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCII.','92')
where subdivisionIdentifier like 'XCII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCII:','92')
where subdivisionIdentifier like 'XCII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIII','93')
where subdivisionIdentifier like 'XCIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIII.','93')
where subdivisionIdentifier like 'XCIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIII:','93')
where subdivisionIdentifier like 'XCIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIV','94')
where subdivisionIdentifier like 'XCIV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIV.','94')
where subdivisionIdentifier like 'XCIV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIV:','94')
where subdivisionIdentifier like 'XCIV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCV','95')
where subdivisionIdentifier like 'XCV';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCV.','95')
where subdivisionIdentifier like 'XCV.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCV:','95')
where subdivisionIdentifier like 'XCV:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVI','96')
where subdivisionIdentifier like 'XCVI';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVI.','96')
where subdivisionIdentifier like 'XCVI.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVI:','96')
where subdivisionIdentifier like 'XCVI:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVII','97')
where subdivisionIdentifier like 'XCVII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVII.','97')
where subdivisionIdentifier like 'XCVII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVII:','97')
where subdivisionIdentifier like 'XCVII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVIII','98')
where subdivisionIdentifier like 'XCVIII';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVIII.','98')
where subdivisionIdentifier like 'XCVIII.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCVIII:','98')
where subdivisionIdentifier like 'XCVIII:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIX','99')
where subdivisionIdentifier like 'XCIX';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIX.','99')
where subdivisionIdentifier like 'XCIX.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'XCIX:','99')
where subdivisionIdentifier like 'XCIX:';

Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'C','100')
where subdivisionIdentifier like 'C';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'C.','100')
where subdivisionIdentifier like 'C.';
Update ResourcesComponents
Set subdivisionIdentifier = replace(subdivisionIdentifier, 'C:','100')
where subdivisionIdentifier like 'C:';
