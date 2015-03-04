# migrationSQL
sql scripts to help meet new models for accession table data

Task list, in sequence
Before migration
# Delete userDefinedBoolean1 from MSSA Accessions table (Maureen) -- only MSSA DB
# ns2: -> xlink -- all DBs
# Clean up Series IDs -- all DBs

After migration
# Accession uniqueness validation step. This happens in AT. This is checking to make sure that the columns we select are unique to the accessions table. -- all DBs
# Updating created and updated timestamps and users from AT to ASpace. We need to test what happens with agent records from AT not yet in ASpace -- all DBs
# Move data from userDefinedBoolean2 into material type table (Mark) -- only MSSA DB
# Turn userDefinedDate2 into an event record with a handful of attributes. (Maureen will create a specification for this and Adam will tidy up the SQL work) -- BRBL DB only
# Turn userDefinedReal1 into an extent subrecord (Mark) -- BRBL DB only
# Move condition note into content_description (Maureen) -- BRBL DB only
# Move userDefinedInteger1, userDefinedInteger2, userDefinedReal2 to extent subrecord (Maureen) -- BRBL DB only
