/* This looks for any content in user_defined.boolean_1 that is associated with an MSSA accession record, deletes it, and associates it with material_type. *?
/* WORK IN PROGRESS */
use testdb_aspace;
Insert into material_types (accession_id, electronic_documents, json_schema_version, user_mtime, system_mtime, create_time)
select accession_id, '1', '1', now(), now(), now() from user_defined 
join accession on user_defined.accession_id = accession.id
join repository ON accession.repo_id = repository.id
where user_defined.boolean_1 is not null 
and repository.repo_code = 'mssa';

/* This looks to any user_defined.real_1 that is associated with an MSSA accession record, deletes it, and associates it with an extent record for the same accession. */
/* WORK IN PROGRESS */
USE testdb_aspace;
INSERT INTO extent 
	(json_schema_version, accession_id, portion_id, number, extent_type_id, user_mtime, system_mtime, create_time)
SELECT 
	'1'
    , accession.id
    , 14 -- the portion id and extent type id are stored in the same column, so these need to be set manually
    -- unless, of course, I set an alias... in which case, enumeration_value.id where enumeration_value.value = "part"
    , user_defined.real_1 
    , 925 -- the portion id and extent type id are stored in the same column, so these need to be set manually
    -- unless I can set an alias, enumeration_value.id whereenumeration_value.value = "megabytes"
	, now()
	, now()
	, now()
FROM
	user_defined
INNER JOIN	accession
	ON user_defined.accession_id = accession.id
INNER JOIN repository
	ON accession.repo_id = repository.id
INNER JOIN extent
	ON accession.id = extent.accession_id
WHERE  user_defined.real_1 IS NOT NULL
AND repository.repo_code='mssa'
