/* Delete userDefinedBoolean1 from MSSA Accessions table */
USE yale_copy;
SELECT userDefinedBoolean1
FROM yale_copy.Accessions;
UPDATE yale_copy.Accessions
SET userDefinedBoolean1 = NULL;
