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
		, concat('["', accessionNumber1, ','
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
