/* Accession uniqueness validation step. This happens in AT. 
This is checking to make sure that the columns we select are unique to the accessions table. */

SELECT * from (

SELECT COUNT(*) as q1
FROM (
SELECT DISTINCT title, accessionNumber1, accessionNumber2, accessionNumber3, accessionNumber4
FROM Accessions) as distinctcount ) as distinctcount

JOIN 
(
SELECT COUNT(*) as q2
FROM (
SELECT  title, accessionNumber1, accessionNumber2, accessionNumber3, accessionNumber4
FROM Accessions) as nondistinctcount ) as nondistinctcount

/* Accessions from AT, updating the audit trail:
We need to test what happens with agent records from AT not yet in ASpace
Write the update statement into ASpace
(from AT) */

Select title
		, concat('["', accessionNumber1, '",'
			, if(accessionNumber2 = '', 'null', concat('"', accessionNumber2, '"')), ','
			, if(accessionNumber3 = '', 'null', concat('"', accessionNumber3, '"')), ','
			, if(accessionNumber4 = '', 'null', concat('"', accessionNumber4, '"')), "]")
		 as identifier 
		, lastUpdated, created, lastUpdatedBy, createdBy
FROM Accessions;

/* from ASpace */
SELECT title, 
identifier,
created_by, /* this will be updated */
last_modified_by, /* this will be updated */
create_time, /* this will be updated */
user_mtime /* this will be updated */
FROM accession;

/* update statement for real -- change database names for at database, aspace */
UPDATE aspace.accession 
join mssa.Accessions on aspace.accession.identifier = CONCAT('["',
            mssa.Accessions.accessionNumber1,
            '",',
            IF(mssa.Accessions.accessionNumber2 = '',
                'null',
                CONCAT('"',
                        mssa.Accessions.accessionNumber2,
                        '"')),
            ',',
            IF(mssa.Accessions.accessionNumber3 = '',
                'null',
                CONCAT('"',
                        mssa.Accessions.accessionNumber3,
                        '"')),
            ',',
            IF(mssa.Accessions.accessionNumber4 = '',
                'null',
                CONCAT('"',
                        mssa.Accessions.accessionNumber4,
                        '"')),
            ']') collate utf8_general_ci
SET 
    aspace.accession.created_by = (mssa.Accessions.createdBy collate utf8_general_ci),
    aspace.accession.create_time = mssa.Accessions.created,
    aspace.accession.last_modified_by = (mssa.Accessions.lastUpdatedBy collate utf8_general_ci),
    aspace.accession.user_mtime = mssa.Accessions.lastUpdated
