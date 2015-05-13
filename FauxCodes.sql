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
