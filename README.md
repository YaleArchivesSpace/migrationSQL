# migrationSQL
sql scripts to help meet new models for accession table data

Task list, in sequence

Before migration

1. Delete userDefinedBoolean1 from MSSA Accessions table (Maureen) -- only MSSA DB - WRITTEN

2. ns2: -> xlink -- all DBs - WRITTEN

3. Clean up Series IDs -- all DBs - WRITTEN

After migration

1. Accession uniqueness validation step. This happens in AT. This is checking to make sure that the columns we select result in a complete set of unique rows in the accessions table. -- all DBs

2. Updating created and updated timestamps and users from AT to ASpace. We need to test what happens with agent records from AT not yet in ASpace -- all DBs

3. Move data from userDefinedBoolean2 into material type table (Mark) -- only MSSA DB

4. Turn userDefinedDate2 into an event record with a handful of attributes. (Maureen will create a specification for this and Adam will tidy up the SQL work) -- BRBL DB only

5. Turn userDefinedReal1 into an extent subrecord (Mark) -- BRBL DB only

6. Move condition note into content_description (Maureen) -- BRBL DB only

7. Move userDefinedInteger1, userDefinedInteger2, userDefinedReal2 to extent subrecord (Maureen) -- BRBL DB only
