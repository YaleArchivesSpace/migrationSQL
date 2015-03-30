# migrationSQL
sql scripts to help meet new models for accession table data

Task list, in sequence

Before migration

1. Delete userDefinedBoolean1 from MSSA Accessions table (Maureen) -- only MSSA DB - WRITTEN

2. ns2: -> xlink -- all DBs - WRITTEN

3. Clean up Series IDs -- all DBs - WRITTEN

4. Change roman numeral Series unitids to arabic - WRITTEN (need to update to for additional variations, ahd even higher roman numerals, unfortunately)

5. We also need to do another barcode test, since the migration tool will now fail if our barcodes don’t match what’s required by the top_containers plugin. -- checked MSSA, all barcodes are now 14 digits.

6. Query which notes are more than 65K characters, hold onto them (and then? Beinecke has 3 of these, Divinity has 1, MSSA has 0).

7. What else? 




After migration

1. Accession uniqueness validation step. This happens in AT. This is checking to make sure that the columns we select result in a complete set of unique rows in the accessions table. (Adam) -- all DBs

2. Updating created and updated timestamps and users from AT to ASpace. We need to test what happens with agent records from AT not yet in ASpace -- (Adam) all DBs

3. Move data from userDefinedBoolean2 into material type table (Mark), MSSA AT, row 56, "material types" update -- only MSSA DB

4. Turn userDefinedDate2 into an event record with a handful of attributes. (Maureen will create a specification for this and Adam will tidy up the SQL work), MSSA AT, row 58, "event" update -- BRBL DB only

5. Turn userDefinedReal1 into an extent subrecord (Mark), MSSA AT, row 61 -- MSSA DB only

6. (Mark), BRBL AT, rows 8-9 -- BRBL DB only

7. (Mark), BRBL AT, rows 17-18  -- BRBL DB only

8. Move condition note into content_description,(Maureen), BRBL AT, row 234, -- BRBL DB only

9. (Mark), BRBL AT, rows 51-52 -- BRBL DB only

10. Move userDefinedInteger1, userDefinedInteger2, userDefinedReal2 to extent subrecord (Maureen), BRBL AT, rows 59, 60, 62 -- BRBL DB only

11. (Mark), BRBL AT, row 64 -- BRBL DB only (make sure sequence of updates is correct!)

12. (Mark) BRBL AT, row 73 -- BRBL DB only

13. (Mark) BRBL AT, row 75 -- BRBL DB only

14. (Mark + Mike, some manual cleanup involved), Payments module updates  -- BRBL DB only

15. Re-attach names and subjects to resources, accessions and archival_objects. We should come up with a good plan for this -- All DBs (Adam, Mark and Maureen)
