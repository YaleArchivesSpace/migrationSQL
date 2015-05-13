/* This script assigns fake-ass barcodes to instances that don't have them. 
What gets a fauxcode? Instances with no barcode, but same indiciator, in the same resource and in the same series get the same faucode
This is important for helping the migrator create distinct top containers. 
Don't forget to delete fauxcodes from ASpace when this is all done! */

/* This script relies on functions found here: https://github.com/yalemssa/ATKreporting */

/* First, count how many fauxcodes you're going to end up with. This should be a count of the distinct, unbarcoded containers in your repository */
use mssa;
SELECT count(distinct(
    CONCAT('Faux.',
            CONCAT(r.resourceIdentifier1,
                    LPAD(r.resourceIdentifier2, 4, '00')),
            IF(series.subdivisionIdentifier <> '',
                CONCAT('.series', series.subdivisionIdentifier),
                ''),
                '.',
            adi.container1Type,
            IFNULL(adi.container1NumericIndicator, ''),
            IFNULL(adi.container1AlphaNumIndicator, '')))) fauxcode
FROM
    ArchDescriptionInstances adi
        JOIN
    ResourcesComponents rc ON adi.resourceComponentId = rc.resourceComponentId
        INNER JOIN
    Resources r ON r.resourceId = GETRESOURCEFROMCOMPONENT(rc.resourceComponentId)
        LEFT OUTER JOIN
    ResourcesComponents series ON GETTOPCOMPONENT(rc.resourceComponentId) = series.resourceComponentID
WHERE
    adi.barcode = ''

/* Now, get a report of all of your components without barcodes and see what the fauxcodes will look like */

use mssa;
SELECT 
    CONCAT(r.resourceIdentifier1,
            LPAD(r.resourceIdentifier2, 4, '00')) CallNo,
    r.title,
    series.subdivisionIdentifier,
    adi.container1Type,
    adi.container1NumericIndicator,
    adi.container1AlphaNumIndicator,
    CONCAT('Faux.',
            CONCAT(r.resourceIdentifier1,
                    LPAD(r.resourceIdentifier2, 4, '00')),
            IF(series.subdivisionIdentifier <> '',
                CONCAT('.series', series.subdivisionIdentifier),
                ''),
            '.',
            adi.container1Type,
            IFNULL(adi.container1NumericIndicator, ''),
            IFNULL(adi.container1AlphaNumIndicator, '')) fauxcode
FROM
    ArchDescriptionInstances adi
        JOIN
    ResourcesComponents rc ON adi.resourceComponentId = rc.resourceComponentId
        INNER JOIN
    Resources r ON r.resourceId = GETRESOURCEFROMCOMPONENT(rc.resourceComponentId)
        LEFT OUTER JOIN
    ResourcesComponents series ON GETTOPCOMPONENT(rc.resourceComponentId) = series.resourceComponentID
WHERE
    adi.barcode = ''

/* Now run the fauxcodes! */
use mssa;
UPDATE ArchDescriptionInstances adi
        JOIN
    ResourcesComponents rc ON adi.resourceComponentId = rc.resourceComponentId
        INNER JOIN
    Resources r ON r.resourceId = GETRESOURCEFROMCOMPONENT(rc.resourceComponentId)
        LEFT OUTER JOIN
    ResourcesComponents series ON GETTOPCOMPONENT(rc.resourceComponentId) = series.resourceComponentID 
SET 
    barcode = CONCAT('Faux.',
            CONCAT(r.resourceIdentifier1,
                    LPAD(r.resourceIdentifier2, 4, '00')),
            IF(series.subdivisionIdentifier <> '',
                CONCAT('.series', series.subdivisionIdentifier),
                ''),
            '.',
            adi.container1Type,
            IFNULL(adi.container1NumericIndicator, ''),
            IFNULL(adi.container1AlphaNumIndicator, ''))
WHERE
    adi.barcode = '';
update archDescriptionInstances set barcode=replace(barcode, ' ', '');

/* deal with common slide boxes*/
use mssa;
update archDescriptionInstances set barcode='CS15'
where barcode like '%CS15%';
update archDescriptionInstances set barcode='CS14'
where barcode like '%CS14%';
update archDescriptionInstances set barcode='CS13'
where barcode like '%CS13%';
update archDescriptionInstances set barcode='CS12'
where barcode like '%CS12%';
update archDescriptionInstances set barcode='CS11'
where barcode like '%CS11%';
update archDescriptionInstances set barcode='CS10'
where barcode like '%CS10%';
update archDescriptionInstances set barcode='CS9'
where barcode like '%CS9%';
update archDescriptionInstances set barcode='CS8'
where barcode like '%CS8%';
update archDescriptionInstances set barcode='CS7'
where barcode like '%CS7%';
update archDescriptionInstances set barcode='CS6'
where barcode like '%CS6%';
update archDescriptionInstances set barcode='CS5'
where barcode like '%CS5%';
update archDescriptionInstances set barcode='CS4'
where barcode like '%CS4%';
update archDescriptionInstances set barcode='CS3'
where barcode like '%CS3%';
update archDescriptionInstances set barcode='CS2'
where barcode like '%CS2%';
update archDescriptionInstances set barcode='CS1'
where barcode like '%CS1%';
update archDescriptionInstances set container1AlphaNumIndicator='CS15'
where barcode like '%CS15%';
update archDescriptionInstances set container1AlphaNumIndicator='CS14'
where barcode like '%CS14%';
update archDescriptionInstances set container1AlphaNumIndicator='CS13'
where barcode like '%CS13%';
update archDescriptionInstances set container1AlphaNumIndicator='CS12'
where barcode like '%CS12%';
update archDescriptionInstances set container1AlphaNumIndicator='CS11'
where barcode like '%CS11%';
update archDescriptionInstances set container1AlphaNumIndicator='CS10'
where barcode like '%CS10%';
update archDescriptionInstances set container1AlphaNumIndicator='CS9'
where barcode like '%CS9%';
update archDescriptionInstances set container1AlphaNumIndicator='CS8'
where barcode like '%CS8%';
update archDescriptionInstances set container1AlphaNumIndicator='CS7'
where barcode like '%CS7%';
update archDescriptionInstances set container1AlphaNumIndicator='CS6'
where barcode like '%CS6%';
update archDescriptionInstances set container1AlphaNumIndicator='CS5'
where barcode like '%CS5%';
update archDescriptionInstances set container1AlphaNumIndicator='CS4'
where barcode like '%CS4%';
update archDescriptionInstances set container1AlphaNumIndicator='CS3'
where barcode like '%CS3%';
update archDescriptionInstances set container1AlphaNumIndicator='CS2'
where barcode like '%CS2%';
update archDescriptionInstances set container1AlphaNumIndicator='CS1'
where barcode like '%CS1%';
